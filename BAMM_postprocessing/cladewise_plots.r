# Cladewise plots

# Load edata object

library(BAMMtools)


#############################
# DIVERSIFICATION

# Calculate rate matrices
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

# Color by ancestral value of mean annual temperature
# 2789	Peridiscaceae	204.4171	
# 2796	Paeoniaceae	112.3091 
# 2828	Daphniphyllaceae	183.9168 
# 2898	Altingiaceae	184.5064 
# 2842	Hamamelidaceae	176.2734 
# 2840	Cercidiphyllaceae	78.45769 
# 2201	Iteaceae	145.7591 
# 2215	Grossulariaceae	68.34745 
# 2200	Saxifragaceae	136.1352 
# 1460	Crassulaceae	134.3333 
# 2199	Cynomoriaceae	122.8781 
# 2096	Aphanopetalaceae	176.1515 
# 2098	Penthoraceae	135.0943 
# 2099	Haloragaceae	160.5824 
observed_values = c(204.4171, 112.3091, 183.9168, 184.5064, 176.2734, 78.45769, 145.7591, 68.34745, 136.1352, 134.3333, 122.8781, 176.1515, 135.0943, 160.5824)
observed_values = observed_values - min(observed_values)
observed_values = observed_values / max(observed_values)
observed_values = observed_values * 99
observed_values = observed_values + 1 # avoid zero values, now ranges [1, 100]
observed_values = as.integer(observed_values) # Scale from 1 to 100, integer only
observed_values

# Result
# 2789	Peridiscaceae	#FF0000
# 2796	Paeoniaceae	#4F00AF
# 2828	Daphniphyllaceae	#D80026
# 2898	Altingiaceae	#D80026
# 2842	Hamamelidaceae	#C80036
# 2840	Cercidiphyllaceae	#1200EC
# 2201	Iteaceae	#90006E
# 2215	Grossulariaceae	#0000FF
# 2200	Saxifragaceae	#7E0080 
# 1460	Crassulaceae	#7B0083
# 2199	Cynomoriaceae	#64009A
# 2096	Aphanopetalaceae	#C80036
# 2098	Penthoraceae	#7B0083
# 2099	Haloragaceae	#AC0052

colfunc <- colorRampPalette(c("blue", "red"))
colors = colfunc(100)

dev.new(width=6, height=5)
plotRateThroughTime(ratematrix_diversification_peridiscaceae, opacity = 0, avgCol="#FF0000", ratetype="netdiv", ylim = c(0, 0.6))
plotRateThroughTime(ratematrix_diversification_paeoniaceae, opacity = 0, avgCol="#4F00AF", ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_daphniphyllaceae, opacity = 0, avgCol="#D80026",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_altingiaceae, opacity = 0, avgCol="#D80026",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_hamamelidaceae, opacity = 0, avgCol="#C80036",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_cercidiphyllaceae, opacity = 0, avgCol="#1200EC",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_iteaceae, opacity = 0, avgCol="#90006E",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_grossulariaceae, opacity = 0, avgCol="#0000FF",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_saxifragaceae, opacity = 0, avgCol="#7E0080",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_crassulaceae, opacity = 0, avgCol="#7B0083",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_cynomoriaceae, opacity = 0, avgCol="#64009A",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_aphanopetalaceae, opacity = 0, avgCol="#C80036",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_penthoraceae, opacity = 0, avgCol="#7B0083",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)
plotRateThroughTime(ratematrix_diversification_haloragaceae, opacity = 0, avgCol="#AC0052",ratetype="netdiv", ylim = c(0, 0.6), add = TRUE)


#############################
# ENVIRONMENT

# Calculate rate matrices
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

dev.new(width=6, height=5)
plotRateThroughTime(ratematrix_environment_peridiscaceae, opacity = 0, avgCol="#FF0000", ylim = c(0, 3e6))
plotRateThroughTime(ratematrix_environment_paeoniaceae, opacity = 0, avgCol="#4F00AF", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_daphniphyllaceae, opacity = 0, avgCol="#D80026", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_altingiaceae, opacity = 0, avgCol="#D80026", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_hamamelidaceae, opacity = 0, avgCol="#C80036", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_cercidiphyllaceae, opacity = 0, avgCol="#1200EC", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_iteaceae, opacity = 0, avgCol="#90006E", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_grossulariaceae, opacity = 0, avgCol="#0000FF", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_saxifragaceae, opacity = 0, avgCol="#7E0080", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_crassulaceae, opacity = 0, avgCol="#7B0083", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_cynomoriaceae, opacity = 0, avgCol="#64009A", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_aphanopetalaceae, opacity = 0, avgCol="#C80036", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_penthoraceae, opacity = 0, avgCol="#7B0083", ylim = c(0, 3e6), add = TRUE)
plotRateThroughTime(ratematrix_environment_haloragaceae, opacity = 0, avgCol="#AC0052", ylim = c(0, 3e6), add = TRUE)


#############################
# PHENOTYPE

# Calculate rate matrices
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

dev.new(width=6, height=5)
plotRateThroughTime(ratematrix_phenotype_peridiscaceae, opacity = 0, avgCol="#FF0000", ylim = c(0, 1.5))
plotRateThroughTime(ratematrix_phenotype_paeoniaceae, opacity = 0, avgCol="#4F00AF", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_daphniphyllaceae, opacity = 0, avgCol="#D80026", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_altingiaceae, opacity = 0, avgCol="#D80026", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_hamamelidaceae, opacity = 0, avgCol="#C80036", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_cercidiphyllaceae, opacity = 0, avgCol="#1200EC", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_iteaceae, opacity = 0, avgCol="#90006E", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_grossulariaceae, opacity = 0, avgCol="#0000FF", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_saxifragaceae, opacity = 0, avgCol="#7E0080", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_crassulaceae, opacity = 0, avgCol="#7B0083", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_cynomoriaceae, opacity = 0, avgCol="#64009A", ylim = c(0, 1.5), add = TRUE)
# plotRateThroughTime(ratematrix_phenotype_aphanopetalaceae, opacity = 0, avgCol="#C80036", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_penthoraceae, opacity = 0, avgCol="#7B0083", ylim = c(0, 1.5), add = TRUE)
plotRateThroughTime(ratematrix_phenotype_haloragaceae, opacity = 0, avgCol="#AC0052", ylim = c(0, 1.5), add = TRUE)
