# UNLADDERIZED edata

### Subset edata object and get best configuration

# Saxifragaceae

edata_diversification.saxifragaceae = subtreeBAMM(edata_diversification, tips = NULL, node = fastMRCA(tree.diversification, "Saxifraga_stolonifera", "Heuchera_mexicana")) # This was corrected
edata_environment.saxifragaceae = subtreeBAMM(edata_environment, tips = NULL, node = fastMRCA(tree.environment, "Saxifraga_stolonifera", "Heuchera_mexicana")) # This was corrected
edata_phenotype.saxifragaceae = subtreeBAMM(edata_phenotype, tips = NULL, node = fastMRCA(tree.phenotype, "Saxifraga_stolonifera", "Heuchera_mexicana"))

best_diversification.saxifragaceae <- getBestShiftConfiguration(edata_diversification.saxifragaceae, expectedNumberOfShifts=1)
best_environment.saxifragaceae <- getBestShiftConfiguration(edata_environment.saxifragaceae, expectedNumberOfShifts=1)
best_phenotype.saxifragaceae <- getBestShiftConfiguration(edata_phenotype.saxifragaceae, expectedNumberOfShifts=1)

# Crassulaceae

edata_diversification.crassulaceae = subtreeBAMM(edata_diversification, tips = NULL, node = fastMRCA(tree.diversification, "Crassula_helmsii", "Sedum_album")) # This was corrected
edata_environment.crassulaceae = subtreeBAMM(edata_environment, tips = NULL, node = fastMRCA(tree.environment, "Crassula_helmsii", "Sedum_album")) # This was corrected
edata_phenotype.crassulaceae = subtreeBAMM(edata_phenotype, tips = NULL, node = fastMRCA(tree.phenotype, "Crassula_helmsii", "Sedum_album")) # This was corrected

best_diversification.crassulaceae <- getBestShiftConfiguration(edata_diversification.crassulaceae, expectedNumberOfShifts=1)
best_environment.crassulaceae <- getBestShiftConfiguration(edata_environment.crassulaceae, expectedNumberOfShifts=1)
best_phenotype.crassulaceae <- getBestShiftConfiguration(edata_phenotype.crassulaceae, expectedNumberOfShifts=1)

# Saxifragaceae alliance

edata_diversification.saxifragaceae_alliance = subtreeBAMM(edata_diversification, tips = NULL, node = fastMRCA(tree.diversification, "Saxifraga_stolonifera", "Itea_virginica"))
edata_environment.saxifragaceae_alliance = subtreeBAMM(edata_environment, tips = NULL, node = fastMRCA(tree.environment, "Saxifraga_stolonifera", "Itea_virginica"))
edata_phenotype.saxifragaceae_alliance = subtreeBAMM(edata_phenotype, tips = NULL, node = fastMRCA(tree.phenotype, "Saxifraga_stolonifera", "Itea_virginica"))

best_diversification.saxifragaceae_alliance <- getBestShiftConfiguration(edata_diversification.saxifragaceae_alliance, expectedNumberOfShifts=1)
best_environment.saxifragaceae_alliance <- getBestShiftConfiguration(edata_environment.saxifragaceae_alliance, expectedNumberOfShifts=1)
best_phenotype.saxifragaceae_alliance <- getBestShiftConfiguration(edata_phenotype.saxifragaceae_alliance, expectedNumberOfShifts=1)

# Crassulaceae alliance

edata_diversification.crassulaceae_alliance = subtreeBAMM(edata_diversification, tips = NULL, node = fastMRCA(tree.diversification, "Crassula_helmsii", "Cynomorium_songaricum")) # This was corrected
edata_environment.crassulaceae_alliance = subtreeBAMM(edata_environment, tips = NULL, node = fastMRCA(tree.environment, "Crassula_helmsii", "Cynomorium_songaricum")) # This was corrected
edata_phenotype.crassulaceae_alliance = subtreeBAMM(edata_phenotype, tips = NULL, node = fastMRCA(tree.phenotype, "Crassula_helmsii", "Cynomorium_songaricum")) # This was corrected

best_diversification.crassulaceae_alliance <- getBestShiftConfiguration(edata_diversification.crassulaceae_alliance, expectedNumberOfShifts=1)
best_environment.crassulaceae_alliance <- getBestShiftConfiguration(edata_environment.crassulaceae_alliance, expectedNumberOfShifts=1)
best_phenotype.crassulaceae_alliance <- getBestShiftConfiguration(edata_phenotype.crassulaceae_alliance, expectedNumberOfShifts=1)


# Note -- to get the shift times, get the best object (best <- getBestShiftConfiguration(edata, expectedNumberOfShifts=1))
# Then, access the nodes and times by: best$eventData[[1]]
# Note there will be one extra node for the root.

# Check node numbering like so, using the trees in the rData BAMM packages:
plot(tree, show.tip.label = TRUE, cex = 0.01, edge.width = 0.25); nodelabels(frame="none",adj=c(1.1,-0.4), cex = .1)

# Extract shift times

eventData_diversification.saxifragaceae = data.frame(best_diversification.saxifragaceae[[10]])
eventData_environment.saxifragaceae = data.frame(best_environment.saxifragaceae[[10]])
eventData_phenotype.saxifragaceae = data.frame(best_phenotype.saxifragaceae[[10]])

eventData_diversification.crassulaceae = data.frame(best_diversification.crassulaceae[[10]])
eventData_environment.crassulaceae = data.frame(best_environment.crassulaceae[[10]])
eventData_phenotype.crassulaceae = data.frame(best_phenotype.crassulaceae[[10]])

eventData_diversification.saxifragaceae_alliance = data.frame(best_diversification.saxifragaceae_alliance[[10]])
eventData_environment.saxifragaceae_alliance = data.frame(best_environment.saxifragaceae_alliance[[10]])
eventData_phenotype.saxifragaceae_alliance = data.frame(best_phenotype.saxifragaceae_alliance[[10]])

eventData_diversification.crassulaceae_alliance = data.frame(best_diversification.crassulaceae_alliance[[10]])
eventData_environment.crassulaceae_alliance = data.frame(best_environment.crassulaceae_alliance[[10]])
eventData_phenotype.crassulaceae_alliance = data.frame(best_phenotype.crassulaceae_alliance[[10]])

#EXAMPLES
# Adjust node height to node depth

# Stem age of Saxifragaceae
max(nodeHeights(tree)) - fastHeight(tree, "Saxifraga_stolonifera", "Ribes_triste")
# Stem age of Crassulaceae
max(nodeHeights(tree)) - fastHeight(tree, "Adromischus_roaneanus", "Tetracarpaea_tasmanica")
# Stem age of Saxifragaceae alliance
max(nodeHeights(tree)) - fastHeight(tree, "Saxifraga_stolonifera", "Cynomorium_songaricum")
# Stem age of Crassulaceae alliance (same as Saxifragaceae alliance)
max(nodeHeights(tree)) - fastHeight(tree, "Saxifraga_stolonifera", "Cynomorium_songaricum")

# Crown age of Saxifragaceae
max(nodeHeights(tree)) - fastHeight(tree, "Saxifraga_stolonifera", "Heuchera_mexicana")
# Crown age of Crassulaceae
max(nodeHeights(tree)) - fastHeight(tree, "Crassula_helmsii", "Sedum_album")
# Crown age of Saxifragaceae alliance
max(nodeHeights(tree)) - fastHeight(tree, "Saxifraga_stolonifera", "Itea_virginica")
# Crown age of Crassulaceae alliance
max(nodeHeights(tree)) - fastHeight(tree, "Crassula_helmsii", "Cynomorium_songaricum")


# Node check Saxifragaceae
fastMRCA(tree, "Saxifraga_stolonifera", "Heuchera_mexicana")
fastMRCA(tree.pheno, "Saxifraga_stolonifera", "Heuchera_mexicana")

# Node check Crassulaceae
fastMRCA(tree, "Crassula_helmsii", "Sedum_album")
fastMRCA(tree.pheno, "Crassula_helmsii", "Sedum_album")

# Node check Saxifragaceae alliance
fastMRCA(tree, "Saxifraga_stolonifera", "Itea_virginica")
fastMRCA(tree.pheno, "Saxifraga_stolonifera", "Itea_virginica")

# Node check Crassulaceae alliance
fastMRCA(tree, "Crassula_helmsii", "Cynomorium_songaricum")
fastMRCA(tree.pheno, "Crassula_helmsii", "Cynomorium_songaricum")

# Adjust ages to be from present
# These use crown ages
eventData_diversification.saxifragaceae$time = max(nodeHeights(tree.diversification)) - fastHeight(tree.diversification, "Saxifraga_stolonifera", "Heuchera_mexicana") - eventData_diversification.saxifragaceae$time
eventData_environment.saxifragaceae$time = max(nodeHeights(tree.environment)) - fastHeight(tree.environment, "Saxifraga_stolonifera", "Heuchera_mexicana") - eventData_environment.saxifragaceae$time
eventData_phenotype.saxifragaceae$time = max(nodeHeights(tree.phenotype)) - fastHeight(tree.phenotype, "Saxifraga_stolonifera", "Heuchera_mexicana") - eventData_phenotype.saxifragaceae$time

eventData_diversification.crassulaceae$time = max(nodeHeights(tree.diversification)) - fastHeight(tree.diversification, "Crassula_helmsii", "Sedum_album") -  eventData_diversification.crassulaceae$time
eventData_environment.crassulaceae$time = max(nodeHeights(tree.environment)) - fastHeight(tree.environment, "Crassula_helmsii", "Sedum_album") - eventData_environment.crassulaceae$time
eventData_phenotype.crassulaceae$time = max(nodeHeights(tree.phenotype)) - fastHeight(tree.phenotype, "Crassula_helmsii", "Sedum_album") - eventData_phenotype.crassulaceae$time

eventData_diversification.saxifragaceae_alliance$time = max(nodeHeights(tree.diversification)) - fastHeight(tree.diversification, "Saxifraga_stolonifera", "Itea_virginica") - eventData_diversification.saxifragaceae_alliance$time
eventData_environment.saxifragaceae_alliance$time = max(nodeHeights(tree.environment)) - fastHeight(tree.environment, "Saxifraga_stolonifera", "Itea_virginica") - eventData_environment.saxifragaceae_alliance$time
eventData_phenotype.saxifragaceae_alliance$time = max(nodeHeights(tree.phenotype)) - fastHeight(tree.phenotype, "Saxifraga_stolonifera", "Itea_virginica") - eventData_phenotype.saxifragaceae_alliance$time

eventData_diversification.crassulaceae_alliance$time = max(nodeHeights(tree.diversification)) - fastHeight(tree.diversification, "Crassula_helmsii", "Cynomorium_songaricum") -  eventData_diversification.crassulaceae_alliance$time
eventData_environment.crassulaceae_alliance$time = max(nodeHeights(tree.environment)) - fastHeight(tree.environment, "Crassula_helmsii", "Cynomorium_songaricum") - eventData_environment.crassulaceae_alliance$time
eventData_phenotype.crassulaceae_alliance$time = max(nodeHeights(tree.phenotype)) - fastHeight(tree.phenotype, "Crassula_helmsii", "Cynomorium_songaricum") - eventData_phenotype.crassulaceae_alliance$time


# Boxplots

dev.new(width=2.5, height=4.75)
boxplot(eventData_diversification.saxifragaceae$time, eventData_environment.saxifragaceae$time, eventData_phenotype.saxifragaceae$time, names=c("", "", ""), ylab = "Time before present (my)", col = c("chartreuse4", "darkorange", "blue"), main = "Saxifragaceae")

dev.new(width=2.5, height=4.75)
boxplot(eventData_diversification.crassulaceae$time, eventData_environment.crassulaceae$time, eventData_phenotype.crassulaceae$time, names=c("", "", ""), ylab = "Time before present (my)", col = c("chartreuse4", "darkorange", "blue"), main = "Crassulaceae")

dev.new(width=2.5, height=4.75)
boxplot(eventData_diversification.saxifragaceae_alliance$time, eventData_environment.saxifragaceae_alliance$time, eventData_phenotype.saxifragaceae_alliance$time, names=c("", "", ""), ylab = "Time before present (my)", col = c("chartreuse4", "darkorange", "blue"), main = "Saxifragaceae\nalliance")

dev.new(width=2.5, height=4.75)
boxplot(eventData_diversification.crassulaceae_alliance$time, eventData_environment.crassulaceae_alliance$time, eventData_phenotype.crassulaceae_alliance$time, names=c("", "", ""), ylab = "Time before present (my)", col = c("chartreuse4", "darkorange", "blue"), main = "Crassulaceae\nalliance")
