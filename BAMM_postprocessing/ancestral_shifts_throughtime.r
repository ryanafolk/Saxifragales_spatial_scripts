library(ape)
library(phytools)
library(caper)
library(geiger)
library(MCMCglmm)
library(nlme) # GLS
library(emmeans) # GLS anova posthoc

tree = read.nexus("ultrametric_occur_matched.tre")

##########################################################################################
# MEAN ANNUAL TEMP
##########################################################################################

trait = read.csv("character1_runID-var_1.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = trait$V2
names(trait.vector) <- row.names(trait)

anc_rec = fastAnc(tree, trait.vector)

edges = data.frame(tree$edge)
	
diffs <- data.frame(NA,NA,NA)
names(diffs) <- c("node", "value", "nodeheight")

# Excludes terminals because these return NAs which we redefine as zero jump
i = 1
# doesn't work due to node order
for (i in 1:length(edges[,1])) {
	#print(edges[i,1])
	#print(edges[i,2])
	#print(anc_rec[toString(edges[i,2])])
	#print(anc_rec[toString(edges[i,1])])
	shifts = c(toString(edges[i,2]), as.numeric(anc_rec[toString(edges[i,2])]) - as.numeric(anc_rec[toString(edges[i,1])]), nodeheight(tree, i))
	print(shifts)
	diffs <- rbind(diffs, shifts)
	i = i + 1
	}
	
diffs <- na.omit(diffs)
diffs <- as.data.frame(matrix(unlist(diffs), nrow = length(unlist(diffs[1]))), stringsAsFactors = FALSE)
names(diffs) <- c("node", "value", "nodeheight")
row.names(diffs) = diffs$node
diffs$node <- NULL
diffs$value <- as.numeric(diffs$value)
diffs$nodeheight <- as.numeric(diffs$nodeheight)
attach(diffs)
diffs <- diffs[order(nodeheight),]
detach(diffs)

# E.g., slice by row name: diffs["2909",]

# Convert node heights to time from present
diffs$nodeheight = 113 - diffs$nodeheight

diffs$value <- diffs$value/10 # Temperature only
plot(diffs$value ~ diffs$nodeheight, xlab = "Time from present (MY)", ylab = "Node-parent difference (child - parent), degrees C", pch = 19, cex = 0.5, xlim = c(120, 0))
title("Mean annual temperature")

# 5 point average -- didn't end up using this
# https://stackoverflow.com/questions/743812/calculating-moving-average
moving_average <- function(x,n=5){filter(x,rep(1/n,n), sides=2)}

meanwindow_line = moving_average(diffs)
meanwindow_line <- data.frame(meanwindow_line)
meanwindow_line <- na.omit(meanwindow_line)
names(meanwindow_line) <- c("value", "nodeheight")

par(new=TRUE)
# plot(meanwindow_line$value ~ meanwindow_line$nodeheight, type = "o", col = "blue", cex = 0)
# regression line
abline(lm(diffs$value ~ diffs$nodeheight))


temp <- subset(diffs, nodeheight <= 15)
plot(temp$value ~ temp$nodeheight, xlab = "Time from present (MY)", ylab = "Node-parent difference (child - parent), degrees C", pch = 19, cex = 0.5, xlim = c(15, 0))
par(new=TRUE)
abline(lm(temp$value ~ temp$nodeheight))
title("Mean annual temperature since 15 mya")
lm(temp$value ~ temp$nodeheight) # Get slope
summary(lm(temp$value ~ temp$nodeheight))$r.squared 
t.test(temp$value) # Get p value for mean different from zero
summary(lm(temp$value ~ temp$nodeheight)) # Get p value for significance of correlation


##########################################################################################
# ANNUAL PRECIPITATION
##########################################################################################

trait = read.csv("character12_runID-var_1.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = trait$V2
names(trait.vector) <- row.names(trait)

anc_rec = fastAnc(tree, trait.vector)

edges = data.frame(tree$edge)
	
diffs <- data.frame(NA,NA,NA)
names(diffs) <- c("node", "value", "nodeheight")

# Excludes terminals because these return NAs which we redefine as zero jump
i = 1
# doesn't work due to node order
for (i in 1:length(edges[,1])) {
	#print(edges[i,1])
	#print(edges[i,2])
	#print(anc_rec[toString(edges[i,2])])
	#print(anc_rec[toString(edges[i,1])])
	shifts = c(toString(edges[i,2]), as.numeric(anc_rec[toString(edges[i,2])]) - as.numeric(anc_rec[toString(edges[i,1])]), nodeheight(tree, i))
	print(shifts)
	diffs <- rbind(diffs, shifts)
	i = i + 1
	}
	
diffs <- na.omit(diffs)
diffs <- as.data.frame(matrix(unlist(diffs), nrow = length(unlist(diffs[1]))), stringsAsFactors = FALSE)
names(diffs) <- c("node", "value", "nodeheight")
row.names(diffs) = diffs$node
diffs$node <- NULL
diffs$value <- as.numeric(diffs$value)
diffs$nodeheight <- as.numeric(diffs$nodeheight)
attach(diffs)
diffs <- diffs[order(nodeheight),]
detach(diffs)

# E.g., slice by row name: diffs["2909",]

# Convert node heights to time from present
diffs$nodeheight = 113 - diffs$nodeheight

plot(diffs$value ~ diffs$nodeheight, xlab = "Time from present (MY)", ylab = "Node-parent difference (child - parent), mm", pch = 19, cex = 0.5, xlim = c(120, 0))

# 5 point average -- didn't end up using this
# https://stackoverflow.com/questions/743812/calculating-moving-average
moving_average <- function(x,n=5){filter(x,rep(1/n,n), sides=2)}

meanwindow_line = moving_average(diffs)
meanwindow_line <- data.frame(meanwindow_line)
meanwindow_line <- na.omit(meanwindow_line)
names(meanwindow_line) <- c("value", "nodeheight")

par(new=TRUE)
# plot(meanwindow_line$value ~ meanwindow_line$nodeheight, type = "o", col = "blue", cex = 0)
# regression line
abline(lm(diffs$value ~ diffs$nodeheight))
title("Annual precipitation")


temp <- subset(diffs, nodeheight <= 15)
plot(temp$value ~ temp$nodeheight, xlab = "Time from present (MY)", ylab = "Node-parent difference (child - parent), mm", pch = 19, cex = 0.5, xlim = c(15, 0))
par(new=TRUE)
abline(lm(temp$value ~ temp$nodeheight))
title("Annual precipitation since 15 mya")
lm(temp$value ~ temp$nodeheight) # Get slope
summary(lm(temp$value ~ temp$nodeheight))$r.squared 
t.test(temp$value) # Get p value
summary(lm(temp$value ~ temp$nodeheight)) # Get p value for significance of correlation


##########################################################################################
# ELEVATION
##########################################################################################

trait = read.csv("character21_runID-var_1.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = trait$V2
names(trait.vector) <- row.names(trait)

anc_rec = fastAnc(tree, trait.vector)

edges = data.frame(tree$edge)
	
diffs <- data.frame(NA,NA,NA)
names(diffs) <- c("node", "value", "nodeheight")

# Excludes terminals because these return NAs which we redefine as zero jump
i = 1
# doesn't work due to node order
for (i in 1:length(edges[,1])) {
	#print(edges[i,1])
	#print(edges[i,2])
	#print(anc_rec[toString(edges[i,2])])
	#print(anc_rec[toString(edges[i,1])])
	shifts = c(toString(edges[i,2]), as.numeric(anc_rec[toString(edges[i,2])]) - as.numeric(anc_rec[toString(edges[i,1])]), nodeheight(tree, i))
	print(shifts)
	diffs <- rbind(diffs, shifts)
	i = i + 1
	}
	
diffs <- na.omit(diffs)
diffs <- as.data.frame(matrix(unlist(diffs), nrow = length(unlist(diffs[1]))), stringsAsFactors = FALSE)
names(diffs) <- c("node", "value", "nodeheight")
row.names(diffs) = diffs$node
diffs$node <- NULL
diffs$value <- as.numeric(diffs$value)
diffs$nodeheight <- as.numeric(diffs$nodeheight)
attach(diffs)
diffs <- diffs[order(nodeheight),]
detach(diffs)

# E.g., slice by row name: diffs["2909",]

# Convert node heights to time from present
diffs$nodeheight = 113 - diffs$nodeheight

plot(diffs$value ~ diffs$nodeheight, xlab = "Time from present (MY)", ylab = "Node-parent difference (child - parent), m", pch = 19, cex = 0.5, xlim = c(120, 0))

# 5 point average -- didn't end up using this
# https://stackoverflow.com/questions/743812/calculating-moving-average
moving_average <- function(x,n=5){filter(x,rep(1/n,n), sides=2)}

meanwindow_line = moving_average(diffs)
meanwindow_line <- data.frame(meanwindow_line)
meanwindow_line <- na.omit(meanwindow_line)
names(meanwindow_line) <- c("value", "nodeheight")

par(new=TRUE)
# plot(meanwindow_line$value ~ meanwindow_line$nodeheight, type = "o", col = "blue", cex = 0)
# regression line
abline(lm(diffs$value ~ diffs$nodeheight))
title("Elevation")

temp <- subset(diffs, nodeheight <= 15)
plot(temp$value ~ temp$nodeheight, xlab = "Time from present (MY)", ylab = "Node-parent difference (child - parent), m", pch = 19, cex = 0.5, xlim = c(15, 0))
par(new=TRUE)
abline(lm(temp$value ~ temp$nodeheight))
title("Elevation since 15 mya")
lm(temp$value ~ temp$nodeheight) # Get slope
summary(lm(temp$value ~ temp$nodeheight))$r.squared 
t.test(temp$value) # Get p value
summary(lm(temp$value ~ temp$nodeheight)) # Get p value for significance of correlation


##########################################################################################
# LATITUDE
##########################################################################################

trait = read.csv("mean_latitudes.treematched.tsv", sep = "\t", row.names=1, header = FALSE)
trait.vector = trait$V2
names(trait.vector) <- row.names(trait)

anc_rec = fastAnc(tree, trait.vector)

edges = data.frame(tree$edge)
	
diffs <- data.frame(NA,NA,NA)
names(diffs) <- c("node", "value", "nodeheight")

# Excludes terminals because these return NAs which we redefine as zero jump
i = 1
# doesn't work due to node order
for (i in 1:length(edges[,1])) {
	#print(edges[i,1])
	#print(edges[i,2])
	#print(anc_rec[toString(edges[i,2])])
	#print(anc_rec[toString(edges[i,1])])
	shifts = c(toString(edges[i,2]), as.numeric(anc_rec[toString(edges[i,2])]) - as.numeric(anc_rec[toString(edges[i,1])]), nodeheight(tree, i))
	print(shifts)
	diffs <- rbind(diffs, shifts)
	i = i + 1
	}
	
diffs <- na.omit(diffs)
diffs <- as.data.frame(matrix(unlist(diffs), nrow = length(unlist(diffs[1]))), stringsAsFactors = FALSE)
names(diffs) <- c("node", "value", "nodeheight")
row.names(diffs) = diffs$node
diffs$node <- NULL
diffs$value <- as.numeric(diffs$value)
diffs$nodeheight <- as.numeric(diffs$nodeheight)
attach(diffs)
diffs <- diffs[order(nodeheight),]
detach(diffs)

# E.g., slice by row name: diffs["2909",]

# Convert node heights to time from present
diffs$nodeheight = 113 - diffs$nodeheight

plot(diffs$value ~ diffs$nodeheight, xlab = "Time from present (MY)", ylab = "Node-parent difference (child - parent), degrees", pch = 19, cex = 0.5, xlim = c(120, 0))

# 5 point average -- didn't end up using this
# https://stackoverflow.com/questions/743812/calculating-moving-average
moving_average <- function(x,n=5){filter(x,rep(1/n,n), sides=2)}

meanwindow_line = moving_average(diffs)
meanwindow_line <- data.frame(meanwindow_line)
meanwindow_line <- na.omit(meanwindow_line)
names(meanwindow_line) <- c("value", "nodeheight")

par(new=TRUE)
# plot(meanwindow_line$value ~ meanwindow_line$nodeheight, type = "o", col = "blue", cex = 0, xlim = c(120, 0))
# regression line
abline(lm(diffs$value ~ diffs$nodeheight))
title("Latitude")


temp <- subset(diffs, nodeheight <= 15)
plot(temp$value ~ temp$nodeheight, xlab = "Time from present (MY)", ylab = "Node-parent difference (child - parent), degrees", pch = 19, cex = 0.5, xlim = c(15, 0))
par(new=TRUE)
abline(lm(temp$value ~ temp$nodeheight))
title("Latitude since 15 mya")
lm(temp$value ~ temp$nodeheight) # Get slope
summary(lm(temp$value ~ temp$nodeheight))$r.squared 
t.test(temp$value) # Get p value
summary(lm(temp$value ~ temp$nodeheight)) # Get p value for significance of correlation






