# Load rdata object with edata files

# Diversification
tip_labels_diversification = edata_diversification$tip.label
rates_diversification = edata_diversification$meanTipLambda - edata_diversification$meanTipMu

diversification.frame = do.call(rbind, Map(data.frame, tip.label = list(tip_labels_diversification), rate = list(rates_diversification)))

# Environment
tip_labels_environment = edata_environment$tip.label
rates_environment = edata_environment$meanTipLambda

environment.frame = do.call(rbind, Map(data.frame, tip.label = list(tip_labels_environment), rate = list(rates_environment)))

# Phenotype
tip_labels_phenotype = edata_phenotype$tip.label
rates_phenotype = edata_phenotype$meanTipLambda

phenotype.frame = do.call(rbind, Map(data.frame, tip.label = list(tip_labels_phenotype), rate = list(rates_phenotype)))

write.table(diversification.frame, "diversification_tiprates.csv", row.names=FALSE, sep="\t", quote = FALSE)
write.table(environment.frame, "environment_tiprates.csv", row.names=FALSE, sep="\t", quote = FALSE)
write.table(phenotype.frame, "phenotype_tiprates.csv", row.names=FALSE, sep="\t", quote = FALSE)