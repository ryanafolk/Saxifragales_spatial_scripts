diversification = read.table("diversification_tiprates.csv", header=TRUE)
diversification_density = density(diversification$rate)
plot(diversification_density)
polygon(diversification_density, col = "green")

environment = read.table("environment_tiprates.csv", header=TRUE)
environment <- environment[which(environment$rate <= 10000000),] # Remove outliers with very low density
environment_density = density(environment$rate)
plot(environment_density)
polygon(environment_density, col = "red")

phenotype = read.table("phenotype_tiprates.csv", header=TRUE)
phenotype <- phenotype[which(phenotype$rate <= 3),] # Remove outliers with very low density
phenotype_density = density(phenotype$rate)
plot(phenotype_density)
polygon(phenotype_density, col = "blue")