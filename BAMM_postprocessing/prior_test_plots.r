# Diversification

library("phytools")
library("ape")
library("BAMMtools")

tree.diversification = read.tree("intree.dated.crossvalidated.occurrencematched.tre")

mcmcout <- read.csv("sax_final_mcmc_out.txt", header=T)
plot(mcmcout$logLik ~ mcmcout$generation)
burnstart <- floor(0.5 * nrow(mcmcout))
postburn <- mcmcout[burnstart:nrow(mcmcout), ]
plot(postburn$logLik ~ postburn$generation)

# I used 10 to 50% burnin as needed
edata_diversification <- getEventData(tree.diversification, eventdata = "sax_final_event_data.txt", burnin=0.5)
ratematrix <- getRateThroughTimeMatrix(edata_diversification) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
dev.new(width=6, height=5)
averageline_diversification = plotRateThroughTime(ratematrix, ratetype = "netdiv", plot = FALSE)$avg
plotRateThroughTime(ratematrix,intervalCol="chartreuse4", avgCol="chartreuse4",ratetype="netdiv", ylim = c(0, max(averageline_diversification)))
abline(v=15, col = ("gold"), lwd = 3)

# Trait

library("phytools")
library("ape")
library("BAMMtools")

tree.environment = read.tree("intree.dated.crossvalidated.occurrencematched.tre")
tree.phenotype = read.tree("intree.dated.crossvalidated.traitmatched.tre")

mcmcout <- read.csv("sax_final_trait_mcmc_out.txt", header=T)
# mcmcout <- read.csv("sax_final_trait_phenotypic_mcmc_out.txt", header=T)
plot(mcmcout$logLik ~ mcmcout$generation)
burnstart <- floor(0.5 * nrow(mcmcout))
postburn <- mcmcout[burnstart:nrow(mcmcout), ]
plot(postburn$logLik ~ postburn$generation)

# I used 50% burnin and 500 million to 1 billion generations as needed
edata_environment <- getEventData(tree.environment, eventdata = "sax_final_trait_event_data.txt", burnin=0.5, type = "trait")
ratematrix <- getRateThroughTimeMatrix(edata_environment) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
dev.new(width=6, height=5)
averageline_environment = plotRateThroughTime(ratematrix, plot = FALSE)$avg
plotRateThroughTime(ratematrix,intervalCol="darkorange", avgCol="darkorange", ylim = c(0, max(averageline_environment)))
abline(v=15, col = ("gold"), lwd = 3)

edata_phenotype <- getEventData(tree.phenotype, eventdata = "sax_final_trait_phenotypic_event_data.txt", burnin=0.5, type = "trait")
ratematrix <- getRateThroughTimeMatrix(edata_phenotype) # Calculating ahead of time avoids repeating calculations to adjust figure; still need to recalculate for different nodes
dev.new(width=6, height=5)
averageline_phenotype = plotRateThroughTime(ratematrix, plot = FALSE)$avg
plotRateThroughTime(ratematrix, intervalCol="blue", avgCol="blue", ylim = c(0, max(averageline_phenotype)))
abline(v=15, col = ("gold"), lwd = 3)
