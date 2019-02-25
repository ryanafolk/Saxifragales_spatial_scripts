# One time curve recalculation in BAMMtools
# Load edata objects

library(BAMMtools)

# This takes a long time
rtt <- getRateThroughTimeMatrix(edata_environment, start.time = 15, end.time = 0, nslices = 500)
meanTraitRate <- colMeans(rtt$beta)
rtt_times_frompresent = 112.99 - rtt$times
# 
dataframe = data.frame(rtt_times_frompresent, meanTraitRate)
write.table(dataframe, "./environment_ratethroughtime_besttree_Miocene.txt")

rtt <- getRateThroughTimeMatrix(edata_phenotype, start.time = 15, end.time = 0, nslices = 500)
meanTraitRate <- colMeans(rtt$beta)
rtt_times_frompresent = 112.99 - rtt$times
dataframe = data.frame(rtt_times_frompresent, meanTraitRate)
write.table(dataframe, "./phenotype_ratethroughtime_besttree_Miocene.txt")

rtt <- getRateThroughTimeMatrix(edata_diversification, start.time = 15, end.time = 0, nslices = 500)
meanTraitRate <- colMeans(rtt$lambda - rtt$mu)
rtt_times_frompresent = 112.99 - rtt$times
dataframe = data.frame(rtt_times_frompresent, meanTraitRate)
write.table(dataframe, "./diversification_ratethroughtime_besttree_Miocene.txt")


# Then check the formatting on tsvs

########################################################################################
# Run for both phenotype and environment
# Analyses will be automatically truncated to 15 mya because the interpolation happens against the 15 my curve calculated above
# Run this for subsequent runs

tempcurve = read.table("~/Desktop/Writings/Saxifragales niche modeling/zachos_etal_2001_d18O_temperatureEpstein1953.txt", sep = "\t", header = TRUE)

library(gplots)
# There are 14821 points in Zachos over 67.0073 my
# Hence 221.2 points per million years or 22.12 points per tenth of a million years. The latter is the fraction 0.00014923747 of the dataset. This will yield windows of 0.1 my

stdev_windows = wapply(tempcurve$Age.Ma, tempcurve$tempC, fun = sd, method = "fraction", width = 0.0014923747) # in 1/100 my windows
range_windows = data.frame(range = stdev_windows$y)
range_windows$ages = stdev_windows$x

# Variability over time
plot(range_windows$range ~ range_windows$ages, pch = 19, cex = 0.4)

# Load trait rate curves
bestfile_environment = read.csv(file = "environment_ratethroughtime_besttree_Miocene.txt", header = TRUE, sep = "\t")
bestfile_phenotype = read.csv(file = "phenotype_ratethroughtime_besttree_Miocene.txt", header = TRUE, sep = "\t")
bestfile_diversification = read.csv(file = "diversification_ratethroughtime_besttree_Miocene.txt", header = TRUE, sep = "\t")

# CORRECTION FOR SLIGHTLY DIFFERENT BEAST ROOT DATE
bestfile_environment$rtt_times_frompresent = bestfile_environment$rtt_times_frompresent + 2.13
bestfile_phenotype$rtt_times_frompresent = bestfile_phenotype$rtt_times_frompresent + 2.13
bestfile_diversification$rtt_times_frompresent = bestfile_diversification$rtt_times_frompresent + 2.13


################
# Run for ENVIRONMENT only
# Get corresponding windowed temperature ranges

# Function to interpolate temperature standard deviations
interpol_by_date = function(var1) {
approx(range_windows$ages, range_windows$range, xout=var1) # Must return y of this object as interpolated probability
}

corresponding_range = lapply(bestfile_environment$rtt_times_frompresent, interpol_by_date)
corresponding_range  = sapply(corresponding_range, "[[", 2) # Collapse list of lists, taking second element only

times = bestfile_environment$rtt_times_frompresent

# Function to interpolate temperature values
interpol_temp_by_date = function(var1) {
approx(tempcurve$Age.Ma, tempcurve$tempC_5pt, xout=var1) # Must return y of this object as interpolated probability
}

# Get corresponding temperature
corresponding_tempC_5pt = lapply(bestfile_environment$rtt_times_frompresent, interpol_temp_by_date)
corresponding_tempC_5pt  = sapply(corresponding_tempC_5pt, "[[", 2) # Collapse list of lists, taking second element only


interpolation = data.frame(times)
interpolation$corresponding_range = corresponding_range
interpolation$traitrate = bestfile_environment$meanTraitRate
interpolation$corresponding_tempC_5pt = corresponding_tempC_5pt

# Plot temperature data
plot(interpolation$corresponding_tempC_5pt ~ interpolation$times, xlim = c(15, 0), pch = 19, cex = 0.5, ylab = "Temperature (degrees C)", xlab = "Time (mya)")
title("Temperature data")

# Plot trait rate vs. temperature
#plot(interpolation$traitrate ~ interpolation$corresponding_tempC_5pt, pch = 19, cex = 0.5, xlab = "Temperature (degrees C)", ylab = "Mean trait rate")
#title("Temperature vs. mean niche lability")
trait_temp_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt) # Exponential model
AIC(trait_temp_model)
summary(trait_temp_model)
dev.new(width=4.5, height=4)
plot(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt, pch = 19, cex = 0.5, xlab = "Temperature (degrees C)", ylab = "Logarithm of mean trait rate")
title("Temperature vs.\nlog mean niche lability")
abline(trait_temp_model)

# Plot trait rate vs. windowed temperature range
dev.new(width=4.5, height=4)
plot(log(interpolation$traitrate) ~ interpolation$corresponding_range, pch = 19, cex = 0.5, xlab = "Temperature standard deviation\nper window (degrees C)", ylab = "Logarithm of mean trait rate")
title("Temperature variability vs.\nlog mean niche lability")
trait_temp_variability_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_range)
AIC(trait_temp_variability_model)
summary(trait_temp_variability_model)
abline(trait_temp_variability_model)

# Combined model
combined_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt + interpolation$corresponding_range) # Exponential model
summary(combined_model)

# Combined standardized model
interpolation$corresponding_tempC_5pt_standardized = (interpolation$corresponding_tempC_5pt - mean(interpolation$corresponding_tempC_5pt, na.rm = TRUE))/sd(interpolation$corresponding_tempC_5pt, na.rm = TRUE)
interpolation$corresponding_range_standardized = (interpolation$corresponding_range - mean(interpolation$corresponding_range, na.rm = TRUE))/sd(interpolation$corresponding_range, na.rm = TRUE)
combined_standardized_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt_standardized + interpolation$corresponding_range_standardized) # Exponential model
summary(combined_standardized_model)
AIC(combined_standardized_model)

################
# Run for PHENOTYPE only
# Get corresponding windowed temperature ranges

# Function to interpolate temperature standard deviations
interpol_by_date = function(var1) {
approx(range_windows$ages, range_windows$range, xout=var1) # Must return y of this object as interpolated probability
}

corresponding_range = lapply(bestfile_phenotype$rtt_times_frompresent, interpol_by_date)
corresponding_range  = sapply(corresponding_range, "[[", 2) # Collapse list of lists, taking second element only

times = bestfile_phenotype$rtt_times_frompresent


# Function to interpolate temperature values
interpol_temp_by_date = function(var1) {
approx(tempcurve$Age.Ma, tempcurve$tempC_5pt, xout=var1) # Must return y of this object as interpolated probability
}

# Get corresponding temperature
corresponding_tempC_5pt = lapply(bestfile_phenotype$rtt_times_frompresent, interpol_temp_by_date)
corresponding_tempC_5pt  = sapply(corresponding_tempC_5pt, "[[", 2) # Collapse list of lists, taking second element only


interpolation = data.frame(times)
interpolation$corresponding_range = corresponding_range
interpolation$traitrate = bestfile_phenotype$meanTraitRate
interpolation$corresponding_tempC_5pt = corresponding_tempC_5pt

# Plot temperature data
plot(interpolation$corresponding_tempC_5pt ~ interpolation$times, xlim = c(15, 0), pch = 19, cex = 0.5, ylab = "Temperature (degrees C)", xlab = "Time (mya)")
title("Temperature data")

# Plot trait rate vs. temperature
#plot(interpolation$traitrate ~ interpolation$corresponding_tempC_5pt, pch = 19, cex = 0.5, xlab = "Temperature (degrees C)", ylab = "Mean trait rate")
#title("Temperature vs. mean phenotypic lability")
dev.new(width=4.5, height=4)
trait_temp_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt) # Exponential model
AIC(trait_temp_model)
summary(trait_temp_model)
plot(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt, pch = 19, cex = 0.5, xlab = "Temperature (degrees C)", ylab = "Logarithm of mean trait rate")
title("Temperature vs.\nlog mean phenotypic lability")
abline(trait_temp_model)

# Plot trait rate vs. windowed temperature range
dev.new(width=4.5, height=4)
plot(log(interpolation$traitrate) ~ interpolation$corresponding_range, pch = 19, cex = 0.5, xlab = "Temperature standard deviation\nper window (degrees C)", ylab = "Logarithm of mean trait rate")
title("Temperature variability vs.\nlog mean phenotypic lability")
trait_temp_variability_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_range)
AIC(trait_temp_variability_model)
summary(trait_temp_variability_model)
abline(trait_temp_variability_model)

# Combined model
combined_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt + interpolation$corresponding_range) # Exponential model
summary(combined_model)

# Combined standardized model
interpolation$corresponding_tempC_5pt_standardized = (interpolation$corresponding_tempC_5pt - mean(interpolation$corresponding_tempC_5pt, na.rm = TRUE))/sd(interpolation$corresponding_tempC_5pt, na.rm = TRUE)
interpolation$corresponding_range_standardized = (interpolation$corresponding_range - mean(interpolation$corresponding_range, na.rm = TRUE))/sd(interpolation$corresponding_range, na.rm = TRUE)
combined_standardized_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt_standardized + interpolation$corresponding_range_standardized) # Exponential model
summary(combined_standardized_model)
AIC(combined_standardized_model)


################
# Run for DIVERSIFICATION only
# Get corresponding windowed temperature ranges

# Function to interpolate temperature standard deviations
interpol_by_date = function(var1) {
approx(range_windows$ages, range_windows$range, xout=var1) # Must return y of this object as interpolated probability
}

corresponding_range = lapply(bestfile_diversification$rtt_times_frompresent, interpol_by_date)
corresponding_range  = sapply(corresponding_range, "[[", 2) # Collapse list of lists, taking second element only

times = bestfile_diversification$rtt_times_frompresent

# Function to interpolate temperature values
interpol_temp_by_date = function(var1) {
approx(tempcurve$Age.Ma, tempcurve$tempC_5pt, xout=var1) # Must return y of this object as interpolated probability
}

# Get corresponding temperature
corresponding_tempC_5pt = lapply(bestfile_diversification$rtt_times_frompresent, interpol_temp_by_date)
corresponding_tempC_5pt  = sapply(corresponding_tempC_5pt, "[[", 2) # Collapse list of lists, taking second element only


interpolation = data.frame(times)
interpolation$corresponding_range = corresponding_range
interpolation$traitrate = bestfile_diversification$meanTraitRate
interpolation$corresponding_tempC_5pt = corresponding_tempC_5pt

# Plot temperature data
#plot(interpolation$corresponding_tempC_5pt ~ interpolation$times, xlim = c(15, 0), pch = 19, cex = 0.5, ylab = "Temperature (degrees C)", xlab = "Time (mya)")
#title("Temperature data")

# Plot diversification rate vs. temperature
#plot(interpolation$traitrate ~ interpolation$corresponding_tempC_5pt, pch = 19, cex = 0.5, xlab = "Temperature (degrees C)", ylab = "Mean net diversification")
#title("Temperature vs. net diversification")
trait_temp_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt) # Exponential model
AIC(trait_temp_model)
summary(trait_temp_model)
dev.new(width=4.5, height=4)
plot(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt, pch = 19, cex = 0.5, xlab = "Temperature (degrees C)", ylab = "Logarithm of mean net diversification")
title("Temperature vs.\nlog net diversification")
abline(trait_temp_model)

# Plot diversification rate vs. windowed temperature range
dev.new(width=4.5, height=4)
plot(log(interpolation$traitrate) ~ interpolation$corresponding_range, pch = 19, cex = 0.5, xlab = "Temperature standard deviation\nper window (degrees C)", ylab = "Logarithm of mean net diversification")
title("Temperature variability vs.\nlog net diversification")
trait_temp_variability_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_range)
AIC(trait_temp_variability_model)
summary(trait_temp_variability_model)
abline(trait_temp_variability_model)

# Combined model
combined_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt + interpolation$corresponding_range) # Exponential model
summary(combined_model)

# Combined standardized model
interpolation$corresponding_tempC_5pt_standardized = (interpolation$corresponding_tempC_5pt - mean(interpolation$corresponding_tempC_5pt, na.rm = TRUE))/sd(interpolation$corresponding_tempC_5pt, na.rm = TRUE)
interpolation$corresponding_range_standardized = (interpolation$corresponding_range - mean(interpolation$corresponding_range, na.rm = TRUE))/sd(interpolation$corresponding_range, na.rm = TRUE)
combined_standardized_model <- lm(log(interpolation$traitrate) ~ interpolation$corresponding_tempC_5pt_standardized + interpolation$corresponding_range_standardized) # Exponential model
summary(combined_standardized_model)
AIC(combined_standardized_model)


