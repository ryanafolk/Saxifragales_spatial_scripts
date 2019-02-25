library(geiger)
library(ape)
library(phytools)
library(ggplot2)

###########################
# Diversification
###########################

tree <- read.newick("intree.dated.crossvalidated.occurrencematched.tre") # Only use forcedultra trees to avoid the VCF method in Geiger fitContinuous
tree = force.ultrametric(tree) # just in case of rounding error
trees = c(tree) # put the entire tree as the first element to force multiphylo object type
# needed to append correctly, will delete later
class(trees)<-"multiPhylo"

for (i in seq(from = length(tree$tip.label) + 1, to = tree$Nnode + length(tree$tip.label))) {
print(i)
trees = c(trees, extract.clade(tree, i))
}

trees[1] = NULL # Remove the extra tree

df_diversification <- data.frame(c(0), c(0))
colnames(df_diversification) <- c("age", "taxon number")

# Pure birth
for (i in trees) {
class(i)<-"phylo"
df_diversification <- rbind(df_diversification, c(max(nodeHeights(i)), bd.ms(phy=i, crown = TRUE, missing = as.integer(length(i$tip.label)*(1-0.606))))) # 60.6% sampled, so this returns the missing taxa based on this percent
}

# Versions with extinction fractions
# 10% extinction
df_diversification <- data.frame(c(0), c(0))
colnames(df_diversification) <- c("age", "ms.diversification")

for (i in trees) {
class(i)<-"phylo"
df_diversification <- rbind(df_diversification, c(max(nodeHeights(i)), bd.ms(phy=i, crown = TRUE, epsilon = 0.1, missing = as.integer(length(i$tip.label)*(1-0.606))))) # 60.6% sampled, so this returns the missing taxa based on this percent
}

# 50% extinction
df_diversification <- data.frame(c(0), c(0))
colnames(df_diversification) <- c("age", "ms.diversification")

for (i in trees) {
class(i)<-"phylo"
df_diversification <- rbind(df_diversification, c(max(nodeHeights(i)), bd.ms(phy=i, crown = TRUE, epsilon = 0.5, missing = as.integer(length(i$tip.label)*(1-0.606))))) # 60.6% sampled, so this returns the missing taxa based on this percent
}

# 90% extinction
df_diversification <- data.frame(c(0), c(0))
colnames(df_diversification) <- c("age", "ms.diversification")

for (i in trees) {
class(i)<-"phylo"
df_diversification <- rbind(df_diversification, c(max(nodeHeights(i)), bd.ms(phy=i, crown = TRUE, epsilon = 0.9, missing = as.integer(length(i$tip.label)*(1-0.606))))) # 60.6% sampled, so this returns the missing taxa based on this percent
}

df_diversification <- df_diversification[which(df_diversification$ms.diversification > 0),] # Remove zero values where MS could not be calculated
df_diversification_reduced <- df_diversification[which(df_diversification$ms.diversification < quantile(df_diversification$ms.diversification, 0.99)),] # Remove outliers
df_diversification_reduced_scaled = df_diversification_reduced
df_diversification_reduced_scaled$ms.diversification = df_diversification_reduced_scaled$ms.diversification/max(df_diversification_reduced_scaled$ms.diversification)

#plot(df_diversification, xlim = c(113, 0), ylim = c(0, max(df_diversification$ms.diversification)), pch = 19, cex = 0.3)
#plot(df_diversification, xlim = c(20, 0), ylim = c(0, max(df_diversification$ms.diversification)), pch = 19, cex = 0.3)

dev.new(width=4, height=4)
ggplot(df_diversification_reduced, aes(x = age, y = ms.diversification)) + xlim(c(15,0))+ theme_bw() + geom_point(data = df_diversification_reduced, aes(x = age, y = ms.diversification)) + geom_smooth(method="lm", formula= (y ~ exp(x)), se=FALSE, color="red") + ggtitle("Pure birth\nAge vs. diversification rate") + xlab("Clade MRCA age (mya)") + ylab("MS clade diversification rate")

# 0.113882994 was median tip rate for BAMM

###########################
# Environment
###########################

tempfile = read.csv("./niche_phylopca_PC1.txt", sep = "\t", row.names=1, header = FALSE)
trait.env = tempfile$V2
lapply(trait.env, as.numeric)
names(trait.env) <- row.names(tempfile)

# The following step takes a long time; an Rdata object has been saved

df_env <- data.frame(c(0), c(0))
colnames(df_env) <- c("age", "trait.rate")

for (i in trees) {
tryCatch({
print(length(df_env$age))
class(i)<-"phylo"
trait_reduced = treedata(i, trait.env)$data
df_env <- rbind(df_env, c(max(nodeHeights(i)), fitContinuous(i, trait_reduced, model = "OU")$opt$sigsq))
}, error=function(e){})
}
# The try is to catch any errors -- may end up with fewer data points than nodes

# LOAD RDATA OBJECT AT THIS POINT

df_env <- df_env[which(df_env$trait.rate > 0),] # Remove zero values where rate could not be calculated

## Reload saved data -- the trait rate metrics take a long time
#df_env = read.table("environment.claderates.txt", header = TRUE, sep = "\t")

df_env_reduced <- df_env[which(df_env$trait.rate < quantile(df_env$trait.rate, 0.99)),] # Remove outliers
df_env_reduced_scaled = df_env_reduced
df_env_reduced_scaled$trait.rate = df_env_reduced_scaled$trait.rate/max(df_env_reduced$trait.rate)

#plot(df_env, ylim = c(0,quantile(df_env$trait.rate, 0.99)))

# Median environmental tip rate was 280769.8535 for BAMM

dev.new(width=4, height=4)
ggplot(df_env_reduced, aes(x = age, y = trait.rate)) + xlim(c(15,0)) + ylim(c(0,quantile(df_env_reduced$trait.rate, 0.99))) + theme_bw() + geom_point(data = df_env_reduced, aes(x = age, y = trait.rate)) + geom_smooth(method="lm", formula= (y ~ exp(x)), se=FALSE, color="red") + ggtitle("Age vs. niche lability") + xlab("Clade MRCA age (mya)") + ylab(expression("Clade niche σ"^2))

###########################
# Phenotype
###########################

tree.pheno <- read.newick("intree.dated.crossvalidated.traitmatched.tre")
tree.pheno = force.ultrametric(tree.pheno) # just in case of rounding error

tempfile = read.csv("./trait_phylomds_PC1.txt", sep = "\t", row.names=1, header = FALSE)
trait.pheno = tempfile$V2
lapply(trait.pheno, as.numeric)
names(trait.pheno) <- row.names(tempfile)

trees.pheno = c(tree.pheno) # put the entire tree as the first element to force multiphylo object type
# needed to append correctly, will delete later
class(trees.pheno)<-"multiPhylo"

for (i in seq(from = length(tree.pheno$tip.label) + 1, to = tree.pheno$Nnode + length(tree.pheno$tip.label))) {
print(i)
trees.pheno = c(trees.pheno, extract.clade(tree.pheno, i))
}

trees.pheno[1] = NULL # Remove the extra tree

# The following step takes a long time; an Rdata object has been saved

df_pheno <- data.frame(c(0), c(0))
colnames(df_pheno) <- c("age", "trait.rate")

for (i in trees.pheno) {
tryCatch({
print(length(df_pheno$age))
class(i)<-"phylo"
trait_reduced = treedata(i, trait.pheno)$data
df_pheno <- rbind(df_pheno, c(max(nodeHeights(i)), fitContinuous(i, trait_reduced, model = "OU")$opt$sigsq))
}, error=function(e){})
}
# The try is to catch any errors -- may end up with fewer data points than nodes

# LOAD RDATA OBJECT AT THIS POINT

df_pheno <- df_pheno[which(df_pheno$trait.rate > 0),] # Remove zero values where rate could not be calculated

## Reload saved data -- the trait rate metrics take a long time
#df_pheno = read.table("phenotypic.claderates.txt", header = TRUE, sep = "\t")

df_pheno_reduced <- df_pheno[which(df_pheno$trait.rate < quantile(df_pheno$trait.rate, 0.99)),] # Remove outliers
df_pheno_reduced_scaled = df_pheno_reduced
df_pheno_reduced_scaled$trait.rate = df_pheno_reduced_scaled$trait.rate/max(df_pheno_reduced$trait.rate)

#plot(df_pheno_reduced_scaled, ylim = c(0,quantile(df_pheno_reduced_scaled$trait.rate, 1)))

# 0.130057756 was median phenotypic trait rate for BAMM

dev.new(width=4, height=4)
ggplot(df_pheno_reduced, aes(x = age, y = trait.rate)) + xlim(c(15,0)) + ylim(c(0,quantile(df_pheno_reduced$trait.rate, 0.99))) + theme_bw() + geom_point(data = df_pheno_reduced, aes(x = age, y = trait.rate)) + geom_smooth(method="lm", formula= (y ~ exp(x)), se=FALSE, color="red") + ggtitle("Age vs. trait lability") + xlab("Clade MRCA age (mya)") + ylab(expression("Clade trait σ"^2))


## Binned analysis code (noisy)
#df_phenotype_binned <- data.frame(c(0), c(0))
#colnames(df_phenotype_binned) <- c("age", "trait.rate")
#
#for (x in seq(from = 0, to = 111.99)) {
#y = x + 1
#temp = df_pheno_reduced_scaled[which(df_pheno_reduced_scaled$age > x),]
#temp = temp[which(temp$age < y),]
#df_phenotype_binned <- rbind(df_phenotype_binned, c(113 - median(temp$age), median(temp$trait.rate)))
#}
#
#plot(df_phenotype_binned)




######
# Merge data frames

diversification_vs_rates <- merge(df_diversification_reduced_scaled,df_pheno_reduced_scaled,by="age")
colnames(diversification_vs_rates)[which(names(diversification_vs_rates) == "trait.rate")] <- "trait.rate.pheno"
diversification_vs_rates <- merge(diversification_vs_rates,df_env_reduced_scaled,by="age")
colnames(diversification_vs_rates)[which(names(diversification_vs_rates) == "trait.rate")] <- "trait.rate.env"


# Restrict to since mid-Miocene
diversification_vs_rates_recent = diversification_vs_rates[which(diversification_vs_rates$age < 15),]



## Diversification vs phenotype
## Asks whether, per clade, diversification rates are significantly different from trait rates expressed as a percentage of contemporaneous rates with outliers excluded
## These are Bonferroni corrected
#t.test(diversification_vs_rates_recent$ms.diversification, diversification_vs_rates_recent$trait.rate.pheno, paired=TRUE, alternative="greater")
#t.test(diversification_vs_rates_recent$ms.diversification, diversification_vs_rates_recent$trait.rate.env, paired=TRUE, alternative="greater")
#t.test(diversification_vs_rates_recent$trait.rate.env, diversification_vs_rates_recent$trait.rate.pheno, paired=TRUE, alternative="greater")


# Asks whether, per clade, diversification rates are significantly different from trait rates expressed as a percentage of contemporaneous rates with outliers excluded
# New version with Tukey HSD
data_vector = c(diversification_vs_rates_recent$ms.diversification, diversification_vs_rates_recent$trait.rate.env, diversification_vs_rates_recent$trait.rate.pheno)
factor_vector = (c(rep("diversification", length(diversification_vs_rates_recent$ms.diversification)), rep("environment", length(diversification_vs_rates_recent$trait.rate.env)), rep("phenotype", length(diversification_vs_rates_recent$trait.rate.pheno))))

anova_object <- data.frame(factor = factor_vector, nodeheight = data_vector)
anova_object$factor <- as.factor(anova_object$factor)

fit <- aov(nodeheight ~ factor, data = anova_object)
summary(fit)

TukeyHSD(fit)

dev.new(width=5, height=4)
boxplot(diversification_vs_rates_recent$ms.diversification, diversification_vs_rates_recent$trait.rate.env, diversification_vs_rates_recent$trait.rate.pheno, names = c("Diversification", "Environment", "Phenotype"), ylab = ("Rate (proportion of max observed)"))
title(main=expression('Pure birth\nProportional rates for MS and σ'^2))