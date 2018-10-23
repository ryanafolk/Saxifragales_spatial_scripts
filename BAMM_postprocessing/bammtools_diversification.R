library("phytools")
library("ape")
library("BAMMtools")

# Both trait and diversification
# check convergence
mcmcout <- read.csv("sax_final_mcmc_out.txt", header=T)
plot(mcmcout$logLik ~ mcmcout$generation)
# burnin 10% of samples -- should be fine based on plots
burnstart <- floor(0.1 * nrow(mcmcout))
postburn <- mcmcout[burnstart:nrow(mcmcout), ]
plot(postburn$logLik ~ postburn$generation)

# check the effective sample sizes of the log-likelihood 
# and the number of shift events present in each sample, should be larger than 200
library(coda)
effectiveSize(postburn$N_shifts)
effectiveSize(postburn$logLik)

# the number of macroevolutionary rate regimes on our phylogenetic tree
post_probs <- table(postburn$N_shifts) / nrow(postburn)
#names(post_probs)
post_probs

# to compute the posterior odds ratio for (say) two models 
post_probs["32"] / post_probs["33"] # How much more posterior probability is in 32 shifts than 33

##Alternatively, we can summarize the posterior distribution of the number of shifts 
## using summary methods:
tree <- read.nexus("ultrametric_occur_matched_forcedultra_ladderized.tre")
tree <- ladderize(tree)
# BAMM IGNORES LADDERIZATION WITHIN R, LADDERIZE FILE INSTEAD


####################################
# Diversification
####################################

# plot.phylo(tree, show.node.label = TRUE)
# ladderize the tree

edata <- getEventData(tree, eventdata = "sax_final_event_data.txt", burnin=0.1)
shift_probs <- summary(edata)
shift_probs
# plot.phylo(tree)

best <- getBestShiftConfiguration(edata, expectedNumberOfShifts=1)


# marginal shift probablities
marg_probs <- marginalShiftProbsTree(edata)
plot.phylo(marg_probs, lwd=0.3, cex=0.02, show.tip.label = TRUE)
branch_priors <- getBranchShiftPriors(tree, expectedNumberOfShifts = 1)
plot(branch_priors, edge.width = 0.3, cex=0.02)
mo <- marginalOddsRatioBranches(edata, branch_priors)


############
# Diversification plots 

##plot phylorate
# For some datasets with large numbers of taxa and rate shifts (e.g., trees with thousands of taxa), all shift configurations may have low probability. There are simply too many parameters in the model to allow a single shift configuration to dominate the credible set. An alternative approach is to extract the shift configuration that maximizes the marginal probability of rate shifts along individual branches. This is very similar to the idea of a maximum clade credibility tree in phylogenetic analysis. BAMM has a function maximumShiftCredibility for extracting this shift configuration:
#for trees with thousands of taxa
# Speciation
msc.set <- maximumShiftCredibility(edata, maximize='product')
msc.config <- subsetEventData(edata, index = msc.set$sampleindex)
plot.bammdata(best, lwd = 0.5, method ='polar', labels=TRUE, spex = "s", cex=0.01, logcolor = TRUE, breaksmethod = "jenks", legend=TRUE)
addBAMMshifts(best, method ='polar', cex=0.4)
# add vtheta = 0.5 to plot.bammdata for no gap in circle tree, rbf = 0 for branches drawn to center

# Net diversification
msc.set <- maximumShiftCredibility(edata, maximize='product')
msc.config <- subsetEventData(edata, index = msc.set$sampleindex)
plot.bammdata(best, lwd = 0.5, method ='polar', labels=TRUE, spex = "netdiv", cex=0.01, logcolor = TRUE, breaksmethod = "jenks", legend=TRUE)
addBAMMshifts(best, method ='polar', cex=0.4)
# add vtheta = 0.5 to plot.bammdata for no gap in circle tree, rbf = 0 for branches drawn to center

# Extinction
msc.set <- maximumShiftCredibility(edata, maximize='product')
msc.config <- subsetEventData(edata, index = msc.set$sampleindex)
plot.bammdata(best, lwd = 0.5, method ='polar', labels=TRUE, spex = "e", cex=0.01, logcolor = TRUE, breaksmethod = "jenks", legend=TRUE)
addBAMMshifts(best, method ='polar', cex=0.4)
# add vtheta = 0.5 to plot.bammdata for no gap in circle tree, rbf = 0 for branches drawn to center

#plot rate through time
ratematrix <- getRateThroughTimeMatrix(edata) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
plotRateThroughTime(ratematrix,intervalCol="red", avgCol="red")
plotRateThroughTime(ratematrix,intervalCol="green", avgCol="green",ratetype="netdiv")
plotRateThroughTime(ratematrix,intervalCol="blue", avgCol="blue",ratetype="extinction")

#caculating Bayes Factor
#to return a pairwise matrix of Bayes Factors
bfmat <- computeBayesFactors(postburn, expectedNumberOfShifts=1, burnin=0.1)
bfmat
#

# Evolutionary rates:
allrates <- getCladeRates(edata)
allrates
#compute the mean speciation rate for tree and estimate the 90% highest posterior density (HPD):
mean(allrates$lambda)
quantile(allrates$lambda, c(0.05, 0.95))



# Environment PC1
tempfile = read.csv("./../BAMM_trait_environmental/niche_phylopca_PC1.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = tempfile$V2
lapply(trait.vector, as.numeric)
names(trait.vector) <- row.names(tempfile)

# If you get a warning about negative log values, you can put logrates = FALSE
library(parallel)
environment_vs_diversification = traitDependentBAMM(edata, trait.vector, 1000, rate = "net diversification", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 
#environment_vs_speciation = traitDependentBAMM(edata, trait.vector, 1000, rate = "speciation", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 
#environment_vs_extinction = traitDependentBAMM(edata, trait.vector, 1000, rate = "extinction", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 

# Use the next two blocks only with a subsampled diversification run matching trait taxa
# Phenotype PC1

# To subset BAMM if needed
tree.phenotypic <- read.nexus("./../BAMM_trait_phenotypic_missingfixed/ultrametric_occur_trait_matched_forcedultra.tre")
edata.subset <- subtreeBAMM(edata, tips = tree.phenotypic$tip.label)
tempfile = read.csv("trait_phylomds_PC1.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = tempfile$V2
lapply(trait.vector, as.numeric)
names(trait.vector) <- row.names(tempfile)
library(parallel)
phenotype_vs_diversification = traitDependentBAMM(edata.subset, trait.vector, 1000, rate = "net diversification", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 


# Biogeo variable 
tempfile = read.csv("biogeo_trait_oneregiononly_environment_matched.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = tempfile$V2
names(trait.vector) <- row.names(tempfile)
library(parallel)
biogeo_vs_diversification = traitDependentBAMM(edata, trait.vector, 1000, rate = "net diversification", return.full = FALSE, method = "kruskal", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 

# Latitude
tempfile = read.csv("mean_latitudes.treematched.tsv", sep = "\t", row.names=1, header = FALSE)
trait.vector = tempfile$V2
lapply(trait.vector, as.numeric)
names(trait.vector) <- row.names(tempfile)
trait.vector <- abs(trait.vector) # Absolute latitude
library(parallel)
latitude_vs_diversification = traitDependentBAMM(edata, trait.vector, 1000, rate = "net diversification", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 
latitude_vs_speciation = traitDependentBAMM(edata, trait.vector, 1000, rate = "speciation", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 
latitude_vs_extinction = traitDependentBAMM(edata, trait.vector, 1000, rate = "extinction", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 


# Elevation
tempfile = read.csv("character21_runID-var_1.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = tempfile$V2
lapply(trait.vector, as.numeric)
names(trait.vector) <- row.names(tempfile)
library(parallel)
elevation_vs_diversification = traitDependentBAMM(edata, trait.vector, 1000, rate = "net diversification", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 
elevation_vs_speciation = traitDependentBAMM(edata, trait.vector, 1000, rate = "speciation", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 
elevation_vs_extinction = traitDependentBAMM(edata, trait.vector, 1000, rate = "extinction", return.full = FALSE, method = "spearman", logrates = TRUE, two.tailed = TRUE, traitorder = NA, nthreads = 4) 



####################
# ESSim statistic
# Run on moose, does not compile on my machine
library(mvtnorm)
source("essim.R")
essim(tree, trait.vector, nsim = 1000)


# Disparity vs diversification
##########
# Get clade rates with internal R node identifiers
# This will take a while -- an hour or two
cladewise_rates = data.frame(node = numeric(), avg_lam = numeric(), avg_mu = numeric())
for (item in sort(unique(tree$edge[,1]))) { # Unique needed because nodes mentioned at least twice for 2 descendants
	rate = getCladeRates(edata, node=item)
	# getCladeRates returns the rates for each sample in the MCMC for ONE node -- need to iterate over nodes, mean for each
	cladewise_rates <- rbind(cladewise_rates, c(item, mean(rate$lambda), mean(rate$mu)))
	print(item)
	}
	
write.table(cladewise_rates, file = "clade_rates_bamm.txt", sep = "\t")

node_translatetable = c()
for (item in sort(unique(tree$edge[,1]))) { # Unique needed because nodes mentioned at least twice for 2 descendants
	node_translatetable[[i]] <- paste(item, "\t", paste(sort(extract.clade(tree, item)$tip.label), collapse=',')) # Sort so we have an unambiguous string order
	}
	
lapply(node_translatetable, function(x) write(x, 'node_translatetable.txt', append = TRUE))

# Run this is in the shell to fix the tab whitespace:
# sed 's/ \t /\t/g' node_translatetable.txt

# Then run sax_trait_matrix_subsetter.py and get the pairwise disparity file from it

# You may need to manually modify the headers to be proper in clade_rates_bamm.txt: node, avg_lam, avg_mu
disparities = read.table("pairwise_dist_clades.txt", header = TRUE)

# You may need to manually modify the headers to be proper in clade_rates_bamm.txt: node, avg_lam, avg_mu
cladewise_rates = read.table("clade_rates_bamm.txt")

dataframe_diversification_vs_disparity = merge(list(disparities), list(cladewise_rates), by="node", all=TRUE)
plot(dataframe_diversification_vs_disparity$avg_lam - dataframe_diversification_vs_disparity$avg_mu, dataframe_diversification_vs_disparity$summed_pairwise_normalized) # i.e. diversification
# Note that in abline, y, x, where as plot is x, y
# Response is disparity
abline(lm(dataframe_diversification_vs_disparity$summed_pairwise_normalized ~ dataframe_diversification_vs_disparity$avg_lam - dataframe_diversification_vs_disparity$avg_mu)) # i.e. diversification
disparity_vs_diversification = lm(dataframe_diversification_vs_disparity$summed_pairwise_normalized ~ dataframe_diversification_vs_disparity$avg_lam - dataframe_diversification_vs_disparity$avg_mu)
summary(disparity_vs_diversification)
# quadratic
disparity_vs_diversification = lm(dataframe_diversification_vs_disparity$summed_pairwise_normalized ~ poly(dataframe_diversification_vs_disparity$avg_lam - dataframe_diversification_vs_disparity$avg_mu, 2))
summary(disparity_vs_diversification)
plot(dataframe_diversification_vs_disparity$summed_pairwise_normalized, poly(dataframe_diversification_vs_disparity$avg_lam - dataframe_diversification_vs_disparity$avg_mu, 2)) # i.e. diversification

###################
# How to get marginal relative density of rates
# This follows Fig. 6 of Rabosky et al. 2014 in Sys. Bio. 
# ALWAYS check node numbering like so:
plot(tree, show.tip.label = TRUE, cex =0.1)
nodelabels(cex = 0.05)
# Should be identical to phytools numbering but make sure -- dropping tips would affect this

# Example below is 
rate_item1 = getCladeRates(edata, node = 2200, nodetype = "include")
rate_item2 = getCladeRates(edata, node = 2200, nodetype = "exclude")
hist(rate_item1$beta/rate_item2$beta, xlim = c(-2, 10), breaks = 20)
quantile(rate_item1$beta/rate_item2$beta, 0.025, na.rm = TRUE) # Lower bound of 95% HPD
quantile(rate_item1$beta/rate_item2$beta, 0.975, na.rm = TRUE) # Upper bound of 95% HPD


