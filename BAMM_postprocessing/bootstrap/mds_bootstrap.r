library(ape)
library(phytools)
library(caper)
library(geiger)
library(MCMCglmm)
library(nlme) # GLS
library(emmeans) # GLS anova posthoc

tree = read.tree("bootstrap_sample.traitmatched.XXX.tre")

# Distance matrix should have same column and row number as taxon number in tree
distancematrix <- read.csv(file="distancematrix.csv_occ_matched.XXX.csv", row.names=1, header = TRUE)

# MDS analysis 
trait_mds = phyl.pca(tree, distancematrix)
trait_mds = data.frame(trait_mds$S)

write.table(trait_mds, file="trait_phylomds_bootXXX.txt", sep = "\t")
