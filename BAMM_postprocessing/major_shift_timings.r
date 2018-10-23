# Note -- to get the niche and phenotype shift times, follow what is in r_continuous_ancestral_reconstruction.r

# Note -- to get the diversification shift times, get the best object (best <- getBestShiftConfiguration(edata, expectedNumberOfShifts=1))
# Then, access the nodes and times by: best$eventData[[1]]
# Note there will be one extra node for the root.



shift_times_diversification = read.table("diversification_best_shift_timings.txt",  header = TRUE, sep = "\t")
# Don't forget to reverse the timescale for diversification as compared to BAMM output -- both ANOVA object and raw data
shift_times_environment = read.table("niche_shift_timings_OU.txt",  header = TRUE, sep = "\t")
shift_times_phenotype = read.table("phenotype_shift_timings_OU.txt",  header = TRUE, sep = "\t")

boxplot(shift_times_diversification$nodeheight, shift_times_environment$nodeheight, shift_times_phenotype$nodeheight, names=c("Net diversification shifts", "Niche major shifts", "Phenotypic major shifts"), ylab = "Time (mya)")


anova_object = read.table("shifts_anova_object.txt",  header = TRUE, sep = "\t")
# Factor column should already be as factor

fit <- aov(nodeheight ~ factor, data = anova_object)
summary(fit)

#
#             Df Sum Sq Mean Sq F value  Pr(>F)    
#factor        2   5088  2544.1   7.684 0.00055 ***
#Residuals   319 105616   331.1                    
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

TukeyHSD(fit)

#  Tukey multiple comparisons of means
#    95% family-wise confidence level
#
#Fit: aov(formula = nodeheight ~ factor, data = anova_object)
#
#$factor
#                                  diff       lwr       upr     p adj
#environment-diversification -12.945232 -20.83118 -5.059280 0.0003943
#phenotype-diversification   -11.665516 -19.59151 -3.739518 0.0017371
#phenotype-environment         1.279716  -3.79772  6.357152 0.8237192
