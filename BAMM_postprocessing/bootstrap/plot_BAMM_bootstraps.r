# Add temp curve
tempcurve = read.table("~/Desktop/Writings/Saxifragales niche modeling/zachos_etal_2001_d18O_temperatureEpstein1953.txt", sep = "\t", header = TRUE)

plot(tempcurve$tempC_5pt ~ tempcurve$Age.Ma, type = "o", col = "gray", cex = 0, xlim = c(120, 0), axes = FALSE, xlab = '', ylab = '')

for (i in list.files(pattern="meanrate*")) {
file = read.csv(file = i, header = TRUE, sep = "\t")
par(new=TRUE)
plot(file$meanTraitRate ~ file$rtt_times_frompresent, type = "o", col = "pink", cex = 0, xlim = c(120, 0), xlab = 'Mya', yaxt = 'n', ylab = '') #, ylab = 'Niche lability')
}

par(new=TRUE)
bestfile = read.csv(file = "besttree_averagerates.tsv", header = TRUE, sep = "\t")
plot(bestfile$meanTraitRate_environment ~ bestfile$rtt_times_environment_frompresent, type = "o", col = "red", cex = 0, xlim = c(120, 0), xlab = 'Mya', yaxt = 'n', ylab = '')

axis(2, pretty(c(0, 1.1*max(file$meanTraitRate))), col='red')
mtext('Niche lability', side = 2, col = 'red')

