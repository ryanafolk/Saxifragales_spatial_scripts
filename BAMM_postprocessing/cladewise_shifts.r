# Use ladderized edata

library(BAMMtools)

best_diversification <- getBestShiftConfiguration(edata_diversification, expectedNumberOfShifts=1)
plot.bammdata(best_diversification, lwd = 0.7, spex = "netdiv", cex=0.01, logcolor = TRUE, breaksmethod = "jenks", legend=TRUE)
addBAMMshifts(best_diversification, cex=0.5)

best_environment <- getBestShiftConfiguration(edata_environment, expectedNumberOfShifts=1)
plot.bammdata(best_environment, lwd = 0.7, spex = "netdiv", cex=0.01, logcolor = TRUE, breaksmethod = "jenks", legend=TRUE)
addBAMMshifts(best_environment, cex=0.5)

best_phenotype <- getBestShiftConfiguration(edata_phenotype, expectedNumberOfShifts=1)
plot.bammdata(best_phenotype, lwd = 0.7, spex = "netdiv", cex=0.01, logcolor = TRUE, breaksmethod = "jenks", legend=TRUE)
addBAMMshifts(best_phenotype, cex=0.5)
