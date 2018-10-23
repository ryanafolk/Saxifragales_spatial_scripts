# Have the edata objects loaded

ratematrix_diversification <- getRateThroughTimeMatrix(edata_diversification) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
ratematrix_environment <- getRateThroughTimeMatrix(edata_environment) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
ratematrix_phenotype <- getRateThroughTimeMatrix(edata_phenotype) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes


averageline_diversification = plotRateThroughTime(ratematrix_diversification, ratetype = "netdiv", plot = FALSE)$avg
plotRateThroughTime(ratematrix_diversification,intervalCol="green", ratetype = "netdiv", avgCol="green", ylim = c(0, max(averageline_diversification)))

par(new=TRUE)
tempcurve = read.table("~/Desktop/Writings/Saxifragales niche modeling/zachos_etal_2001_d18O_temperatureEpstein1953.txt", sep = "\t", header = TRUE)
plot(tempcurve$tempC_5pt ~ tempcurve$Age.Ma, type = "o", col = "gray", cex = 0, xlim = c(120, 0), axes = FALSE, xlab = '', ylab = '')


# Save as separate files, recombine in inkscape
# Need to get average line y values to get a good max for the plot
averageline_environment = plotRateThroughTime(ratematrix_environment, plot = FALSE)$avg
plotRateThroughTime(ratematrix_environment,intervalCol="red", avgCol="red", ylim = c(0, max(averageline_environment)))
# Save as separate files, recombine in inkscape
averageline_phenotype = plotRateThroughTime(ratematrix_phenotype, plot = FALSE)$avg
plotRateThroughTime(ratematrix_phenotype,intervalCol="blue", avgCol="blue", ylim = c(0, max(averageline_phenotype)))

# Send the temperature curve to the back