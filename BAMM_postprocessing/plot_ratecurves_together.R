# Have the edata objects loaded

ratematrix_diversification <- getRateThroughTimeMatrix(edata_diversification) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
ratematrix_environment <- getRateThroughTimeMatrix(edata_environment) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
ratematrix_phenotype <- getRateThroughTimeMatrix(edata_phenotype) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes

dev.new(width=6, height=5)
averageline_diversification = plotRateThroughTime(ratematrix_diversification, ratetype = "netdiv", plot = FALSE)$avg
plotRateThroughTime(ratematrix_diversification,intervalCol="chartreuse4", ratetype = "netdiv", avgCol="chartreuse4", ylim = c(0, max(averageline_diversification)))

par(new=TRUE)
tempcurve = read.table("~/Desktop/Writings/Saxifragales niche modeling/zachos_etal_2001_d18O_temperatureEpstein1953.txt", sep = "\t", header = TRUE)
plot(tempcurve$tempC_5pt ~ tempcurve$Age.Ma, type = "o", col = "gray", cex = 0, xlim = c(120, 0), axes = FALSE, xlab = '', ylab = '')


# Save as separate files, recombine in inkscape
# Need only one copy of the temperature curve
dev.new(width=6, height=5)
averageline_environment = plotRateThroughTime(ratematrix_environment, plot = FALSE)$avg
plotRateThroughTime(ratematrix_environment,intervalCol="darkorange", avgCol="darkorange", ylim = c(0, max(averageline_environment)))


dev.new(width=6, height=5)
averageline_phenotype = plotRateThroughTime(ratematrix_phenotype, plot = FALSE)$avg
plotRateThroughTime(ratematrix_phenotype,intervalCol="blue", avgCol="blue", ylim = c(0, max(averageline_phenotype)))


# Send the temperature curve to the back

###### 
# Alternative method

# This relies on rescaling the data
ratematrix_phenotype_transformed = ratematrix_phenotype
ratematrix_phenotype_transformed[[1]] = (ratematrix_phenotype_transformed[[1]] - min(plotRateThroughTime(ratematrix_phenotype_transformed, opacity = 0, avgCol="blue", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_phenotype_transformed, opacity = 0, avgCol="blue", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_phenotype_transformed, opacity = 0, avgCol="blue", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_phenotype_transformed, opacity = 0, avgCol="blue", ylim = c(0,1))

ratematrix_environment_transformed = ratematrix_environment
ratematrix_environment_transformed[[1]] = (ratematrix_environment_transformed[[1]] - min(plotRateThroughTime(ratematrix_environment_transformed, opacity = 0, avgCol="red", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_environment_transformed, opacity = 0, avgCol="red", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_environment_transformed, opacity = 0, avgCol="red", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_environment_transformed, opacity = 0, avgCol="red", ylim = c(0,1), add = TRUE)

ratematrix_diversification_transformed = ratematrix_diversification
ratematrix_diversification_transformed[[1]] = (ratematrix_diversification_transformed[[1]] - min(plotRateThroughTime(ratematrix_diversification_transformed, opacity = 0, avgCol="green", ylim = c(0, 1), plot = FALSE)$avg))/(max(plotRateThroughTime(ratematrix_diversification_transformed, opacity = 0, avgCol="green", ylim = c(0, 1), plot = FALSE)$avg) - min(plotRateThroughTime(ratematrix_diversification_transformed, opacity = 0, avgCol="green", ylim = c(0, 1), plot = FALSE)$avg))
plotRateThroughTime(ratematrix_diversification_transformed, opacity = 0, avgCol="green", ylim = c(0,1), add = TRUE)
