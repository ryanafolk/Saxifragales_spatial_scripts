diversification = read.table("diversification_tiprates.csv", header=TRUE)
diversification_density = density(diversification$rate)
dev.new(width=6, height=3)
plot(diversification_density)
polygon(diversification_density, col = "chartreuse4")

environment = read.table("environment_tiprates.csv", header=TRUE)
environment <- environment[which(environment$rate <= 10000000),] # Remove outliers with very low density
environment_density = density(environment$rate)
dev.new(width=6, height=3)
plot(environment_density)
polygon(environment_density, col = "darkorange")

phenotype = read.table("phenotype_tiprates.csv", header=TRUE)
phenotype <- phenotype[which(phenotype$rate <= 3),] # Remove outliers with very low density
phenotype_density = density(phenotype$rate)
dev.new(width=6, height=3)
plot(phenotype_density)
polygon(phenotype_density, col = "blue")