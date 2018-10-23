library(ape)
library(phytools)

# Distance matrix should have same column and row number as taxon number in tree
distancematrix <- read.csv(file="distancematrix.csv_occ_matched.csv", row.names=1, header = TRUE)

tree = read.nexus("ultrametric_occur_trait_matched.tre")

trait_mds = phyl.pca(tree, distancematrix)
trait_mds = data.frame(trait_mds$S)

PC1 = trait_mds$PC1
names(PC1) <- row.names(trait_mds)
PC1 = data.frame(PC1)
PC2 = trait_mds$PC2
names(PC2) <- row.names(trait_mds)
PC2 = data.frame(PC2)
PC3 = trait_mds$PC3
names(PC3) <- row.names(trait_mds)
PC3 = data.frame(PC3)
plot(trait_mds$PC1, trait_mds$PC2)
ggplot(trait_mds, aes(PC1,PC2)) + geom_point() + geom_text(aes(label=row.names(trait_mds)))

write.table(trait_mds, file="trait_phylomds.txt", sep = "\t")

