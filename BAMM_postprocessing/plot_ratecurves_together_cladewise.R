# Have the edata objects loaded

ratematrix_diversification_peridiscaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Medusandra_richardsiana", "Peridiscus_lucidus")) # Peridiscaceae
ratematrix_diversification_paeoniaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Paeonia_morisii", "Paeonia_brownii")) # Paeoniaceae
ratematrix_diversification_daphniphyllaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Daphniphyllum_macropodum", "Daphniphyllum_laurinum")) # Daphniphyllaceae
ratematrix_diversification_altingiaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Semiliquidambar_cathayensis", "Liquidambar_styraciflua")) # Altingiaceae
ratematrix_diversification_hamamelidaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Rhodoleia_championii", "Hamamelis_virginiana")) # Hamamelidaceae
ratematrix_diversification_cercidiphyllaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Cercidiphyllum_japonicum", "Cercidiphyllum_magnificum")) # Cercidiphyllaceae
ratematrix_diversification_iteaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Itea_virginica", "Pterostemon_rotundifolius")) # Iteaceae
ratematrix_diversification_grossulariaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Ribes_giraldii", "Ribes_aureum")) # Grossulariaceae
ratematrix_diversification_saxifragaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Saxifraga_stolonifera", "Heuchera_mexicana")) # Saxifragaceae 
ratematrix_diversification_crassulaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Crassula_helmsii", "Sedum_album")) # Crassulaceae
ratematrix_diversification_cynomoriaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Cynomorium_songaricum", "Cynomorium_coccineum")) # Cynomoriaceae
ratematrix_diversification_aphanopetalaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Aphanopetalum_resinosum", "Aphanopetalum_clematideum")) # Aphanopetalaceae
ratematrix_diversification_penthoraceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Penthorum_sedoides", "Penthorum_chinense")) # Penthoraceae
ratematrix_diversification_haloragaceae <- getRateThroughTimeMatrix(edata_diversification, node = fastMRCA(tree.diversification, "Glischrocaryon_behrii", "Myriophyllum_aquaticum")) # Haloragaceae

ratematrix_environment_peridiscaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Medusandra_richardsiana", "Peridiscus_lucidus")) # Peridiscaceae
ratematrix_environment_paeoniaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Paeonia_morisii", "Paeonia_brownii")) # Paeoniaceae
ratematrix_environment_daphniphyllaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Daphniphyllum_macropodum", "Daphniphyllum_laurinum")) # Daphniphyllaceae
ratematrix_environment_altingiaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Semiliquidambar_cathayensis", "Liquidambar_styraciflua")) # Altingiaceae
ratematrix_environment_hamamelidaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Rhodoleia_championii", "Hamamelis_virginiana")) # Hamamelidaceae
ratematrix_environment_cercidiphyllaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Cercidiphyllum_japonicum", "Cercidiphyllum_magnificum")) # Cercidiphyllaceae
ratematrix_environment_iteaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Itea_virginica", "Pterostemon_rotundifolius")) # Iteaceae
ratematrix_environment_grossulariaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Ribes_giraldii", "Ribes_aureum")) # Grossulariaceae
ratematrix_environment_saxifragaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Saxifraga_stolonifera", "Heuchera_mexicana")) # Saxifragaceae
ratematrix_environment_crassulaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Crassula_helmsii", "Sedum_album")) # Crassulaceae
ratematrix_environment_cynomoriaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Cynomorium_songaricum", "Cynomorium_coccineum")) # Cynomoriaceae
ratematrix_environment_aphanopetalaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Aphanopetalum_resinosum", "Aphanopetalum_clematideum")) # Aphanopetalaceae
ratematrix_environment_penthoraceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Penthorum_sedoides", "Penthorum_chinense")) # Penthoraceae
ratematrix_environment_haloragaceae <- getRateThroughTimeMatrix(edata_environment, node = fastMRCA(tree.environment, "Glischrocaryon_behrii", "Myriophyllum_aquaticum")) # Haloragaceae

ratematrix_phenotype_peridiscaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Medusandra_richardsiana", "Peridiscus_lucidus")) # Peridiscaceae
ratematrix_phenotype_paeoniaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Paeonia_daurica", "Paeonia_brownii")) # Paeoniaceae -- different for this smaller tree
ratematrix_phenotype_daphniphyllaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Daphniphyllum_macropodum", "Daphniphyllum_laurinum")) # Daphniphyllaceae
ratematrix_phenotype_altingiaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Semiliquidambar_cathayensis", "Liquidambar_styraciflua")) # Altingiaceae
ratematrix_phenotype_hamamelidaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Rhodoleia_championii", "Hamamelis_virginiana")) # Hamamelidaceae
ratematrix_phenotype_cercidiphyllaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Cercidiphyllum_japonicum", "Cercidiphyllum_magnificum")) # Cercidiphyllaceae
ratematrix_phenotype_iteaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Itea_virginica", "Pterostemon_rotundifolius")) # Iteaceae
ratematrix_phenotype_grossulariaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Ribes_giraldii", "Ribes_aureum")) # Grossulariaceae
ratematrix_phenotype_saxifragaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Saxifraga_stolonifera", "Heuchera_mexicana")) # Saxifragaceae
ratematrix_phenotype_crassulaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Crassula_helmsii", "Sedum_album")) # Crassulaceae
ratematrix_phenotype_cynomoriaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Cynomorium_songaricum", "Cynomorium_coccineum")) # Cynomoriaceae
# ratematrix_phenotype_aphanopetalaceae <- getRateThroughTimeMatrix(edata_phenotype, node = x) # Aphanopetalaceae # Monotypic for this dataset
ratematrix_phenotype_penthoraceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Penthorum_sedoides", "Penthorum_chinense")) # Penthoraceae
ratematrix_phenotype_haloragaceae <- getRateThroughTimeMatrix(edata_phenotype, node = fastMRCA(tree.phenotype, "Glischrocaryon_behrii", "Myriophyllum_aquaticum")) # Haloragaceae

####################
# Co-plot curves. We extract the average line from the plotting function, then normalize the rates as a proportion of the maximum rate

# NOTE: Rate curves can be younger in the phenotype analyses. This is due to differing taxon sampling resulting in a different family MRCA. It occurs in Paeoniaceae
# Check node numbering like so, using the trees in the rData BAMM packages:
plot(tree.pheno, show.tip.label = TRUE, cex = 0.01, edge.width = 0.25); nodelabels(frame="none",adj=c(1.1,-0.4), cex = .1)


# peridiscaceae
dev.new(width=4, height=3)
ratematrix_phenotype_peridiscaceae_transformed = ratematrix_phenotype_peridiscaceae
ratematrix_phenotype_peridiscaceae_transformed[[1]] = (ratematrix_phenotype_peridiscaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_peridiscaceae_transformed, opacity = 0, avgCol="blue", xlim = c(90, 0), ylim = c(0,1))

ratematrix_environment_peridiscaceae_transformed = ratematrix_environment_peridiscaceae
ratematrix_environment_peridiscaceae_transformed[[1]] = (ratematrix_environment_peridiscaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_peridiscaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(90, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_peridiscaceae_transformed = ratematrix_diversification_peridiscaceae
ratematrix_diversification_peridiscaceae_transformed[[1]] = (ratematrix_diversification_peridiscaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_peridiscaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_peridiscaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(90, 0), ylim = c(0,1), add = TRUE)

# paeoniaceae
ratematrix_phenotype_paeoniaceae_transformed = ratematrix_phenotype_paeoniaceae
ratematrix_phenotype_paeoniaceae_transformed[[1]] = (ratematrix_phenotype_paeoniaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_paeoniaceae_transformed, opacity = 0, avgCol="blue", xlim = c(15, 0), ylim = c(0,1))

ratematrix_environment_paeoniaceae_transformed = ratematrix_environment_paeoniaceae
ratematrix_environment_paeoniaceae_transformed[[1]] = (ratematrix_environment_paeoniaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_paeoniaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(15, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_paeoniaceae_transformed = ratematrix_diversification_paeoniaceae
ratematrix_diversification_paeoniaceae_transformed[[1]] = (ratematrix_diversification_paeoniaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_paeoniaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_paeoniaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(15, 0), ylim = c(0,1), add = TRUE)

# daphniphyllaceae
ratematrix_phenotype_daphniphyllaceae_transformed = ratematrix_phenotype_daphniphyllaceae
ratematrix_phenotype_daphniphyllaceae_transformed[[1]] = (ratematrix_phenotype_daphniphyllaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_daphniphyllaceae_transformed, opacity = 0, avgCol="blue", xlim = c(18, 0), ylim = c(0,1))

ratematrix_environment_daphniphyllaceae_transformed = ratematrix_environment_daphniphyllaceae
ratematrix_environment_daphniphyllaceae_transformed[[1]] = (ratematrix_environment_daphniphyllaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_daphniphyllaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(18, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_daphniphyllaceae_transformed = ratematrix_diversification_daphniphyllaceae
ratematrix_diversification_daphniphyllaceae_transformed[[1]] = (ratematrix_diversification_daphniphyllaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_daphniphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_daphniphyllaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(18, 0), ylim = c(0,1), add = TRUE)

# altingiaceae
ratematrix_phenotype_altingiaceae_transformed = ratematrix_phenotype_altingiaceae
ratematrix_phenotype_altingiaceae_transformed[[1]] = (ratematrix_phenotype_altingiaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_altingiaceae_transformed, opacity = 0, avgCol="blue", xlim = c(18, 0), ylim = c(0,1))

ratematrix_environment_altingiaceae_transformed = ratematrix_environment_altingiaceae
ratematrix_environment_altingiaceae_transformed[[1]] = (ratematrix_environment_altingiaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_altingiaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(18, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_altingiaceae_transformed = ratematrix_diversification_altingiaceae
ratematrix_diversification_altingiaceae_transformed[[1]] = (ratematrix_diversification_altingiaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_altingiaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_altingiaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(18, 0), ylim = c(0,1), add = TRUE)

# hamamelidaceae
ratematrix_phenotype_hamamelidaceae_transformed = ratematrix_phenotype_hamamelidaceae
ratematrix_phenotype_hamamelidaceae_transformed[[1]] = (ratematrix_phenotype_hamamelidaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_hamamelidaceae_transformed, opacity = 0, avgCol="blue", xlim = c(30, 0), ylim = c(0,1))

ratematrix_environment_hamamelidaceae_transformed = ratematrix_environment_hamamelidaceae
ratematrix_environment_hamamelidaceae_transformed[[1]] = (ratematrix_environment_hamamelidaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_hamamelidaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(30, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_hamamelidaceae_transformed = ratematrix_diversification_hamamelidaceae
ratematrix_diversification_hamamelidaceae_transformed[[1]] = (ratematrix_diversification_hamamelidaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_hamamelidaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_hamamelidaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(30, 0), ylim = c(0,1), add = TRUE)

# cercidiphyllaceae
ratematrix_phenotype_cercidiphyllaceae_transformed = ratematrix_phenotype_cercidiphyllaceae
ratematrix_phenotype_cercidiphyllaceae_transformed[[1]] = (ratematrix_phenotype_cercidiphyllaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_cercidiphyllaceae_transformed, opacity = 0, avgCol="blue", xlim = c(15, 0), ylim = c(0,1))

ratematrix_environment_cercidiphyllaceae_transformed = ratematrix_environment_cercidiphyllaceae
ratematrix_environment_cercidiphyllaceae_transformed[[1]] = (ratematrix_environment_cercidiphyllaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_cercidiphyllaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(15, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_cercidiphyllaceae_transformed = ratematrix_diversification_cercidiphyllaceae
ratematrix_diversification_cercidiphyllaceae_transformed[[1]] = (ratematrix_diversification_cercidiphyllaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_cercidiphyllaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_cercidiphyllaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(15, 0), ylim = c(0,1), add = TRUE)

# iteaceae
ratematrix_phenotype_iteaceae_transformed = ratematrix_phenotype_iteaceae
ratematrix_phenotype_iteaceae_transformed[[1]] = (ratematrix_phenotype_iteaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_iteaceae_transformed, opacity = 0, avgCol="blue", xlim = c(92, 0), ylim = c(0,1))

ratematrix_environment_iteaceae_transformed = ratematrix_environment_iteaceae
ratematrix_environment_iteaceae_transformed[[1]] = (ratematrix_environment_iteaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_iteaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(92, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_iteaceae_transformed = ratematrix_diversification_iteaceae
ratematrix_diversification_iteaceae_transformed[[1]] = (ratematrix_diversification_iteaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_iteaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_iteaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(92, 0), ylim = c(0,1), add = TRUE)

# grossulariaceae
ratematrix_phenotype_grossulariaceae_transformed = ratematrix_phenotype_grossulariaceae
ratematrix_phenotype_grossulariaceae_transformed[[1]] = (ratematrix_phenotype_grossulariaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_grossulariaceae_transformed, opacity = 0, avgCol="blue", xlim = c(28, 0), ylim = c(0,1))

ratematrix_environment_grossulariaceae_transformed = ratematrix_environment_grossulariaceae
ratematrix_environment_grossulariaceae_transformed[[1]] = (ratematrix_environment_grossulariaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_grossulariaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(28, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_grossulariaceae_transformed = ratematrix_diversification_grossulariaceae
ratematrix_diversification_grossulariaceae_transformed[[1]] = (ratematrix_diversification_grossulariaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_grossulariaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_grossulariaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(28, 0), ylim = c(0,1), add = TRUE)

# saxifragaceae
ratematrix_phenotype_saxifragaceae_transformed = ratematrix_phenotype_saxifragaceae
ratematrix_phenotype_saxifragaceae_transformed[[1]] = (ratematrix_phenotype_saxifragaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_saxifragaceae_transformed, opacity = 0, avgCol="blue", xlim = c(72, 0), ylim = c(0,1))

ratematrix_environment_saxifragaceae_transformed = ratematrix_environment_saxifragaceae
ratematrix_environment_saxifragaceae_transformed[[1]] = (ratematrix_environment_saxifragaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_saxifragaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(72, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_saxifragaceae_transformed = ratematrix_diversification_saxifragaceae
ratematrix_diversification_saxifragaceae_transformed[[1]] = (ratematrix_diversification_saxifragaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_saxifragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_saxifragaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(72, 0), ylim = c(0,1), add = TRUE)

# crassulaceae
ratematrix_phenotype_crassulaceae_transformed = ratematrix_phenotype_crassulaceae
ratematrix_phenotype_crassulaceae_transformed[[1]] = (ratematrix_phenotype_crassulaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_crassulaceae_transformed, opacity = 0, avgCol="blue", xlim = c(80, 0), ylim = c(0,1))

ratematrix_environment_crassulaceae_transformed = ratematrix_environment_crassulaceae
ratematrix_environment_crassulaceae_transformed[[1]] = (ratematrix_environment_crassulaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_crassulaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(80, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_crassulaceae_transformed = ratematrix_diversification_crassulaceae
ratematrix_diversification_crassulaceae_transformed[[1]] = (ratematrix_diversification_crassulaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_crassulaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_crassulaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(80, 0), ylim = c(0,1), add = TRUE)

# cynomoriaceae
ratematrix_phenotype_cynomoriaceae_transformed = ratematrix_phenotype_cynomoriaceae
ratematrix_phenotype_cynomoriaceae_transformed[[1]] = (ratematrix_phenotype_cynomoriaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_cynomoriaceae_transformed, opacity = 0, avgCol="blue", xlim = c(23, 0), ylim = c(0,1))

ratematrix_environment_cynomoriaceae_transformed = ratematrix_environment_cynomoriaceae
ratematrix_environment_cynomoriaceae_transformed[[1]] = (ratematrix_environment_cynomoriaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_cynomoriaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(23, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_cynomoriaceae_transformed = ratematrix_diversification_cynomoriaceae
ratematrix_diversification_cynomoriaceae_transformed[[1]] = (ratematrix_diversification_cynomoriaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_cynomoriaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_cynomoriaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(23, 0), ylim = c(0,1), add = TRUE)

# penthoraceae
ratematrix_phenotype_penthoraceae_transformed = ratematrix_phenotype_penthoraceae
ratematrix_phenotype_penthoraceae_transformed[[1]] = (ratematrix_phenotype_penthoraceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_penthoraceae_transformed, opacity = 0, avgCol="blue", xlim = c(15, 0), ylim = c(0,1))

ratematrix_environment_penthoraceae_transformed = ratematrix_environment_penthoraceae
ratematrix_environment_penthoraceae_transformed[[1]] = (ratematrix_environment_penthoraceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_penthoraceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(15, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_penthoraceae_transformed = ratematrix_diversification_penthoraceae
ratematrix_diversification_penthoraceae_transformed[[1]] = (ratematrix_diversification_penthoraceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_penthoraceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_penthoraceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(15, 0), ylim = c(0,1), add = TRUE)

# haloragaceae
ratematrix_phenotype_haloragaceae_transformed = ratematrix_phenotype_haloragaceae
ratematrix_phenotype_haloragaceae_transformed[[1]] = (ratematrix_phenotype_haloragaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_haloragaceae_transformed, opacity = 0, avgCol="blue", xlim = c(32, 0), ylim = c(0,1))

ratematrix_environment_haloragaceae_transformed = ratematrix_environment_haloragaceae
ratematrix_environment_haloragaceae_transformed[[1]] = (ratematrix_environment_haloragaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_haloragaceae_transformed, opacity = 0, avgCol="darkorange", xlim = c(32, 0), ylim = c(0,1), add = TRUE)

ratematrix_diversification_haloragaceae_transformed = ratematrix_diversification_haloragaceae
ratematrix_diversification_haloragaceae_transformed[[1]] = (ratematrix_diversification_haloragaceae_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_haloragaceae_transformed, opacity = 0, avgCol="#FF0000", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_haloragaceae_transformed, opacity = 0, avgCol="chartreuse4", xlim = c(32, 0), ylim = c(0,1), add = TRUE)


