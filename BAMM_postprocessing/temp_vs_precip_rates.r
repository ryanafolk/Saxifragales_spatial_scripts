# cd to base directory

library("phytools")
library("ape")
library("BAMMtools")

tree <- read.tree("./BAMM_trait_environmental_preciponly/ultrametric_occur_matched_forcedultra.tre")

edata_temp <- getEventData(tree, eventdata = "./BAMM_trait_environmental_temponly/sax_final_trait_event_data_reduced.txt", burnin=0.1, type = "trait")
edata_precip <- getEventData(tree, eventdata = "./BAMM_trait_environmental_preciponly/sax_final_trait_event_data_reduced.txt", burnin=0.1, type = "trait")

save.image(file="edata_objects.RData")

load(file="edata_objects.RData")

ratematrix_temp <- getRateThroughTimeMatrix(edata_temp) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
ratematrix_precip <- getRateThroughTimeMatrix(edata_precip) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes


plotRateThroughTime(ratematrix_temp,intervalCol="red", avgCol="red", ylim = c(0,quantile(ratematrix_temp$beta, .99)))
par(new=TRUE)
plotRateThroughTime(ratematrix_precip,intervalCol="blue", avgCol="blue", ylim = c(0,quantile(ratematrix_precip$beta, .99)))
# Displace axis in inkscape


plotRateThroughTime(ratematrix_temp, intervals=c(0.05,0.95), intervalCol='gray70', avgCol='red', opacity=0.5, ylim = c(0,max(ratematrix_temp$beta))) # can also do quantile(ratematrix_temp$beta, .99)
par(new=TRUE)
plotRateThroughTime(ratematrix_precip, intervals=c(0.05,0.95), intervalCol='gray70', avgCol='blue', opacity=0.5, ylim = c(0,max(ratematrix_precip$beta)))

plotRateThroughTime(ratematrix_precip,intervalCol="blue", avgCol="blue", ylim = c(0,quantile(ratematrix_precip$beta, .99)), intervals=seq(from=0,0.95,by=0.01), intervalCol='gray')
# Displace axis in inkscape
