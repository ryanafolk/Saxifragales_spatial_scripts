
setwd("/Volumes/My Passport for Mac/Saxifragales_work/BAMM_bootstrap/diversification/")
intersects_diversification = c()
for (i in list.files(pattern="meanrate*")) {
file = read.csv(file = i, header = TRUE, sep = "\t")
file$meanTraitRate <- file$meanTraitRate/max(file$meanTraitRate)
file = subset(file, rtt_times_frompresent < 65) # Only consider since the KT boundary since phenotype rates initially decreased and we are interested in the increase
intersects_diversification = c(intersects_diversification,(approx(file$meanTraitRate, file$rtt_times_frompresent, xout=0.5)$y)) # time where mean trait rate is 50% of modern value
}

setwd("/Volumes/My Passport for Mac/Saxifragales_work/BAMM_bootstrap/environmental/")
intersects_environment = c()
for (i in list.files(pattern="meanrate*")) {
file = read.csv(file = i, header = TRUE, sep = "\t")
file$meanTraitRate <- file$meanTraitRate/max(file$meanTraitRate)
file = subset(file, rtt_times_frompresent < 65) # Only consider since the KT boundary since phenotype rates initially decreased and we are interested in the increase
intersects_environment = c(intersects_environment,(approx(file$meanTraitRate, file$rtt_times_frompresent, xout=0.5)$y)) # time where mean trait rate is 50% of modern value
}

setwd("/Volumes/My Passport for Mac/Saxifragales_work/BAMM_bootstrap/phenotypic/")
intersects_phenotype = c()
for (i in list.files(pattern="meanrate*")) {
file = read.csv(file = i, header = TRUE, sep = "\t")
file$meanTraitRate <- file$meanTraitRate/max(file$meanTraitRate)
file = subset(file, rtt_times_frompresent < 65) # Only consider since the KT boundary since phenotype rates initially decreased and we are interested in the increase
intersects_phenotype = c(intersects_phenotype,(approx(file$meanTraitRate, file$rtt_times_frompresent, xout=0.5, ties = min)$y)) # time where mean trait rate is 50% of modern value
}


mean(intersects_diversification)
mean(intersects_environment)
mean(intersects_phenotype)

boxplot(intersects_diversification,intersects_environment,intersects_phenotype, names = c("Net diversification shifts", "Niche major shifts", "Phenotype major shifts"), ylab = "Time (mya)")

title("Time to 50% of present-day rate parameter")

##################################################################



anova_object = read.table("anova_object.txt",  header = TRUE, sep = "\t")
# Factor column should already be as factor

fit <- aov(time ~ factor, data = anova_object)
summary(fit)

#             Df Sum Sq Mean Sq F value Pr(>F)    
#factor        2   4860  2430.2   204.4 <2e-16 ***
#Residuals   147   1748    11.9                   
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


TukeyHSD(fit)

#  Tukey multiple comparisons of means
#    95% family-wise confidence level
#
#Fit: aov(formula = time ~ factor, data = anova_object)
#
#$factor
#                                  diff        lwr        upr    p adj
#environment-diversification -10.325190 -11.958116  -8.692265 0.00e+00
#phenotype-diversification   -13.277847 -14.910772 -11.644921 0.00e+00
#phenotype-environment        -2.952656  -4.585582  -1.319730 9.85e-05

