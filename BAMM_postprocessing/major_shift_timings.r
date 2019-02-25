# Note -- to get the niche and phenotype shift times, follow what is in r_continuous_ancestral_reconstruction.r

# Note -- to get the diversification shift times, get the best object (best <- getBestShiftConfiguration(edata, expectedNumberOfShifts=1))
# Then, access the nodes and times by: best$eventData[[1]]
# Note there will be one extra node for the root.



#shift_times_diversification = read.table("diversification_best_shift_timings.txt",  header = TRUE, sep = "\t")
# Don't forget to reverse the timescale for diversification as compared to BAMM output -- both ANOVA object and raw data

best <- getBestShiftConfiguration(edata_diversification, expectedNumberOfShifts=1)
shift_times_diversification = best$eventData[[1]]
shift_times_diversification$time = 112.99 - shift_times_diversification$time
# Version for beast treepl tree
# shift_times_diversification$time = 115.125 - shift_times_diversification$time

# These are generated in OU ancestral reconstruction script
shift_times_environment = read.table("niche_shift_timings_OU.txt",  header = TRUE, sep = "\t")
shift_times_phenotype = read.table("phenotype_shift_timings_OU.txt",  header = TRUE, sep = "\t")

dev.new(width=3, height=5)
boxplot(shift_times_diversification$time, shift_times_environment$nodeheight, shift_times_phenotype$nodeheight, names=c("", "", ""), ylab = "Time before present (my)", col = c("chartreuse4", "darkorange", "blue"))
title("Timing of major shifts")

data_vector = c(shift_times_diversification$time, shift_times_environment$nodeheight, shift_times_phenotype$nodeheight)
factor_vector = (c(rep("diversification", length(shift_times_diversification$time)), rep("environment", length(shift_times_environment$nodeheight)), rep("phenotype", length(shift_times_phenotype$nodeheight))))

anova_object <- data.frame(factor = factor_vector, nodeheight = data_vector)
anova_object$factor <- as.factor(anova_object$factor)

fit <- aov(nodeheight ~ factor, data = anova_object)
summary(fit)


TukeyHSD(fit)

