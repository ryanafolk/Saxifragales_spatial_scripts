library(diversitree)
library(phytools)

tree <- read.tree("ultrametric_occur_matched_forcedultra.tre")
states.sd <- 1/200

trait.vector <- fastBM(tree)

p <- starting.point.quasse(tree, trait.vector)
p

# Initiate an example model -- we will change this later, since constant vs. hump is the comparison from empirical data
lik.sigmoid <- make.quasse(tree, trait.vector, states.sd, sigmoid.x, constant.x)
lik.sigmoid <- constrain(lik.sigmoid, drift ~ 0)

p.start <- c(p[1], p[1], mean(trait.vector), 1, p[2:3])
names(p.start) <- argnames(lik.sigmoid)
p.start

lower <- c(0, 0, min(trait.vector), -Inf, 0, 0)

lik.hump <- make.quasse(tree, trait.vector, states.sd, noroptimal.x, constant.x)
lik.hump <- constrain(lik.hump, drift ~ 0)
fit.hump <- find.mle(lik.hump, p.start, control=list(parscale=.1), lower=lower, verbose=1)
fit.hump

lik.constant <- constrain(lik.sigmoid, l.y1 ~ l.y0, l.xmid ~ 0, l.r ~ 1)
fit.constant <- find.mle(lik.constant, p.start[argnames(lik.constant)], control=list(parscale=.1), lower=0, verbose=1)
fit.constant

anova <- anova(fit.constant, hump=fit.hump)
anova

