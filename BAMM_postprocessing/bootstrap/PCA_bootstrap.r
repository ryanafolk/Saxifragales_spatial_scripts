library(ape)
library(phytools)
library(caper)
library(geiger)
library(MCMCglmm)
library(nlme) # GLS
library(emmeans) # GLS anova posthoc

tree = read.tree("bootstrap_sample.XXX.tre")

#####################################################################################
# Load environmental data
tempfile = read.csv("character1_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO1 = tempfile$V2
names(trait.BIO1) <- row.names(tempfile)
trait.BIO1 = data.frame(trait.BIO1)
# Should be significant for annual precipitation
tempfile = read.csv("character2_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO2 = tempfile$V2
names(trait.BIO2) <- row.names(tempfile)
trait.BIO2 = data.frame(trait.BIO2)
# Should be significant for annual precipitation
tempfile = read.csv("character3_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO3 = tempfile$V2
names(trait.BIO3) <- row.names(tempfile)
trait.BIO3 = data.frame(trait.BIO3)
# Should be significant for annual precipitation
tempfile = read.csv("character4_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO4 = tempfile$V2
names(trait.BIO4) <- row.names(tempfile)
trait.BIO4 = data.frame(trait.BIO4)
# Should be significant for annual precipitation
tempfile = read.csv("character5_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO5 = tempfile$V2
names(trait.BIO5) <- row.names(tempfile)
trait.BIO5 = data.frame(trait.BIO5)
# Should be significant for annual precipitation
tempfile = read.csv("character6_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO6 = tempfile$V2
names(trait.BIO6) <- row.names(tempfile)
trait.BIO6 = data.frame(trait.BIO6)
# Should be significant for annual precipitation
tempfile = read.csv("character7_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO7 = tempfile$V2
names(trait.BIO7) <- row.names(tempfile)
trait.BIO7 = data.frame(trait.BIO7)
# Should be significant for annual precipitation
tempfile = read.csv("character8_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO8 = tempfile$V2
names(trait.BIO8) <- row.names(tempfile)
trait.BIO8 = data.frame(trait.BIO8)
# Should be significant for annual precipitation
tempfile = read.csv("character9_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO9 = tempfile$V2
names(trait.BIO9) <- row.names(tempfile)
trait.BIO9 = data.frame(trait.BIO9)
# Should be significant for annual precipitation
tempfile = read.csv("character10_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO10 = tempfile$V2
names(trait.BIO10) <- row.names(tempfile)
trait.BIO10 = data.frame(trait.BIO10)
# Should be significant for annual precipitation
tempfile = read.csv("character11_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO11 = tempfile$V2
names(trait.BIO11) <- row.names(tempfile)
trait.BIO11 = data.frame(trait.BIO11)
tempfile = read.csv("character12_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO12 = tempfile$V2
names(trait.BIO12) <- row.names(tempfile)
trait.BIO12 = data.frame(trait.BIO12)
tempfile = read.csv("character13_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO13 = tempfile$V2
names(trait.BIO13) <- row.names(tempfile)
trait.BIO13 = data.frame(trait.BIO13)
tempfile = read.csv("character14_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO14 = tempfile$V2
names(trait.BIO14) <- row.names(tempfile)
trait.BIO14 = data.frame(trait.BIO14)
tempfile = read.csv("character15_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO15 = tempfile$V2
names(trait.BIO15) <- row.names(tempfile)
trait.BIO15 = data.frame(trait.BIO15)
tempfile = read.csv("character16_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO16 = tempfile$V2
names(trait.BIO16) <- row.names(tempfile)
trait.BIO16 = data.frame(trait.BIO16)
tempfile = read.csv("character17_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO17 = tempfile$V2
names(trait.BIO17) <- row.names(tempfile)
trait.BIO17 = data.frame(trait.BIO17)
tempfile = read.csv("character18_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO18 = tempfile$V2
names(trait.BIO18) <- row.names(tempfile)
trait.BIO18 = data.frame(trait.BIO18)
tempfile = read.csv("character19_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO19 = tempfile$V2
names(trait.BIO19) <- row.names(tempfile)
trait.BIO19 = data.frame(trait.BIO19)
tempfile = read.csv("character20_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO20 = tempfile$V2
names(trait.BIO20) <- row.names(tempfile)
trait.BIO20 = data.frame(trait.BIO20)
tempfile = read.csv("character21_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO21 = tempfile$V2
names(trait.BIO21) <- row.names(tempfile)
trait.BIO21 = data.frame(trait.BIO21)
tempfile = read.csv("character22_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO22 = tempfile$V2
names(trait.BIO22) <- row.names(tempfile)
trait.BIO22 = data.frame(trait.BIO22)
tempfile = read.csv("character23_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO23 = tempfile$V2
names(trait.BIO23) <- row.names(tempfile)
trait.BIO23 = data.frame(trait.BIO23)
tempfile = read.csv("character24_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO24 = tempfile$V2
names(trait.BIO24) <- row.names(tempfile)
trait.BIO24 = data.frame(trait.BIO24)
tempfile = read.csv("character25_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO25 = tempfile$V2
names(trait.BIO25) <- row.names(tempfile)
trait.BIO25 = data.frame(trait.BIO25)
tempfile = read.csv("character26_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO26 = tempfile$V2
names(trait.BIO26) <- row.names(tempfile)
trait.BIO26 = data.frame(trait.BIO26)
tempfile = read.csv("character27_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO27 = tempfile$V2
names(trait.BIO27) <- row.names(tempfile)
trait.BIO27 = data.frame(trait.BIO27)
tempfile = read.csv("character28_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO28 = tempfile$V2
names(trait.BIO28) <- row.names(tempfile)
trait.BIO28 = data.frame(trait.BIO28)
tempfile = read.csv("character29_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO29 = tempfile$V2
names(trait.BIO29) <- row.names(tempfile)
trait.BIO29 = data.frame(trait.BIO29)
tempfile = read.csv("character30_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO30 = tempfile$V2
names(trait.BIO30) <- row.names(tempfile)
trait.BIO30 = data.frame(trait.BIO30)
tempfile = read.csv("character31_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO31 = tempfile$V2
names(trait.BIO31) <- row.names(tempfile)
trait.BIO31 = data.frame(trait.BIO31)
tempfile = read.csv("character32_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO32 = tempfile$V2
names(trait.BIO32) <- row.names(tempfile)
trait.BIO32 = data.frame(trait.BIO32)
tempfile = read.csv("character33_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO33 = tempfile$V2
names(trait.BIO33) <- row.names(tempfile)
trait.BIO33 = data.frame(trait.BIO33)
tempfile = read.csv("character34_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO34 = tempfile$V2
names(trait.BIO34) <- row.names(tempfile)
trait.BIO34 = data.frame(trait.BIO34)
tempfile = read.csv("character35_runID-bootXXX.txt", sep = "\t", row.names=1, header = FALSE)
trait.BIO35 = tempfile$V2
names(trait.BIO35) <- row.names(tempfile)
trait.BIO35 = data.frame(trait.BIO35)

# PCA analysis 
dataframe_pca = merge(list(trait.BIO1,trait.BIO2,trait.BIO3,trait.BIO4,trait.BIO5,trait.BIO6,trait.BIO7,trait.BIO8,trait.BIO9,trait.BIO10,trait.BIO11,trait.BIO12,trait.BIO13,trait.BIO14,trait.BIO15,trait.BIO16,trait.BIO17,trait.BIO18,trait.BIO19), list(trait.BIO20,trait.BIO21,trait.BIO22,trait.BIO23,trait.BIO24,trait.BIO25,trait.BIO26,trait.BIO27,trait.BIO28,trait.BIO29,trait.BIO30,trait.BIO31,trait.BIO32,trait.BIO33,trait.BIO34,trait.BIO35), by="row.names", all=TRUE)
row.names(dataframe_pca) <- dataframe_pca$Row.names
dataframe_pca$Row.names <- NULL # Causes problems
matrix_pca = data.matrix(dataframe_pca, rownames.force=TRUE)
niche_pca = phyl.pca(tree, matrix_pca)
niche_pca = data.frame(niche_pca$S)
write.table(niche_pca, file="niche_phylopca_bootXXX.txt", sep = "\t")
