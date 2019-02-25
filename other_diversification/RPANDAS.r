library(ape)
library(phytools)
library(RPANDA)

# To install the dependency mvMORPH, I had to downgrade to a lower version of gcc via:

# brew uninstall gcc
# curl -O http://r.research.att.com/libs/gfortran-4.8.2-darwin13.tar.bz2
# sudo tar fvxz gfortran-4.8.2-darwin13.tar.bz2 -C /

# And then (or before) install mvMORPH:

# library(devtools)
# install_github("JClavel/mvMORPH", build_vignettes = TRUE)

# Then RPANDAS

# library(devtools)
# install_github("hmorlon/PANDA")

# Starting values and functions taken from manual https://cran.r-project.org/web/packages/RPANDA/RPANDA.pdf


tree <- read.newick("ultrametric_occur_matched_forcedultra.tre")

# Constant speciation, no extinction

f.lamb <-function(t,y){y[1]} # Constant speciation
f.mu<-function(t,y){0} # No extinction
lamb_par<-c(0.09) # Initial value
mu_par<-c() # Initial value

result_cst <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, cst.lamb=TRUE, fix.mu=TRUE, dt=1e-3)
# Only use fix and cst if these are actually fixed/constant -- to reduce computation
# dt is a grain for the likelihood calculation

# Exponential speciation with time, no extinction

f.lamb <- function(t,y){y[1] * exp(y[2] * t)}
f.mu <- function(t,y){0}
lamb_par <-c (0.05, 0.01)
mu_par <-c ()

result_exp <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, expo.lamb=TRUE, fix.mu=TRUE, dt=1e-3)

# Linear speciation with time, no extinction

f.lamb <- function(t,y){y[1] + y[2] * t}
f.mu <- function(t,y){0}
lamb_par <- c(0.09, 0.001)
mu_par <- c()

result_lin <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, fix.mu=TRUE, dt=1e-3)


# Exponential speciation with time, constant extinction

f.lamb<-function(t,y){y[1] * exp(y[2] * t)}
f.mu <-function(t,y){y[1]}
lamb_par <- c(0.05, 0.01)
mu_par <- c(0.005)
result_bexp_dcst <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, expo.lamb=TRUE, cst.mu=TRUE, dt=1e-3)


# Linear speciation with time, constant extinction

f.lamb <- function(t,y){y[1] + y[2] * t}
f.mu <-function(t,y){y[1]}
lamb_par <- c(0.09, 0.001)
mu_par <- c(0.005)
result_blin_dcst <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, cst.mu=TRUE, dt=1e-3)


# Exponential speciation with time, linear extinction

f.lamb<-function(t,y){y[1] * exp(y[2] * t)}
f.mu <- function(t,y){y[1] + y[2] * t}
lamb_par <- c(0.05, 0.01)
mu_par <- c(0.09, 0.001)
result_bexp_dlin <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, expo.lamb=TRUE, dt=1e-3)


# Linear speciation with time, exponential extinction

f.lamb <- function(t,y){y[1] + y[2] * t}
f.mu<-function(t,y){y[1] * exp(y[2] * t)}
lamb_par <- c(0.09, 0.001)
mu_par <- c(0.05, 0.01)
result_blin_dexp <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, expo.mu=TRUE, dt=1e-3)


# Linear speciation with time, linear extinction

f.lamb <- function(t,y){y[1] + y[2] * t}
f.mu <- function(t,y){y[1] + y[2] * t}
lamb_par <- c(0.09, 0.001)
mu_par <- c(0.09, 0.001)
result_blin_dlin <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, dt=1e-3)


# Exponential speciation with time, exponential extinction

f.lamb<-function(t,y){y[1] * exp(y[2] * t)}
f.mu<-function(t,y){y[1] * exp(y[2] * t)}
lamb_par <- c(0.05, 0.01)
mu_par <- c(0.05, 0.01)
result_bexp_dexp <- fit_bd(tree, 112.99, f.lamb, f.mu, lamb_par, mu_par, f=0.606, expo.lamb=TRUE, expo.mu=TRUE, dt=1e-3)





######
# Environmental dependence model with best-fit diversification model

tree <- read.newick("ultrametric_occur_matched_forcedultra.tre")

tempcurve = read.table("~/Desktop/Writings/Saxifragales\ niche\ modeling/dO18_crameretal_2009/cramer_etal_2009_d18O_temperatureEpstein1953.txt", sep = "\t", header = TRUE)
tempcurve$d18O_adj <- NULL
tempcurve$d18O_adj_5pt_average <- NULL
tempcurve = tempcurve[complete.cases(tempcurve), ] # Remove any rows with missing data

dof<-smooth.spline(tempcurve[,1], tempcurve[,2])$df # Calculate degrees of freedom following RPANDA manual

# Temperature dependence

# Constant speciation wrt temp, no extinction
f.lamb <- function(t,x,y){y[1] * x} # Constant speciation # Note this is different from above
f.mu <- function(t,x,y){0}
lamb_par <- c(0.09)
mu_par <- c()
historical_temp_bconst_d0 <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, fix.mu=TRUE, df = dof, f = 0.606, dt=1e-3)

# Exponential speciation wrt temp, no extinction
f.lamb <- function(t,x,y){y[1] * exp(y[2] * x)} # Note this is different from above
f.mu <- function(t,x,y){0}
lamb_par <- c(0.05, 0.01)
mu_par <- c()
historical_temp_bexp_d0 <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, fix.mu=TRUE, df = dof, f = 0.606, dt=1e-3)

# Linear speciation wrt temp, no extinction
f.lamb <- function(t,x,y){y[1] + y[2] * x} 
f.mu <- function(t,x,y){0}
lamb_par <- c(0.09, 0.001)
mu_par <- c()
historical_temp_blin_d0 <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, fix.mu=TRUE, df = dof, f = 0.606, dt=1e-3)

# Exponential speciation wrt temp, constant extinction
f.lamb <- function(t,x,y){y[1] * exp(y[2] * x)}
f.mu <- function(t,x,y){y[1]}
lamb_par <- c(0.05, 0.01)
mu_par <- c(0.005)
historical_temp_bexp_dcst <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)

# Linear speciation wrt temp, constant extinction
f.lamb <- function(t,x,y){y[1] + y[2] * x}
f.mu <- function(t,x,y){y[1]}
lamb_par <- c(0.09, 0.001)
mu_par <- c(0.005)
historical_temp_blin_dcst <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)

# Exponential speciation wrt temp, linear extinction wrt temp
f.lamb <- function(t,x,y){y[1] * exp(y[2] * x)}
f.mu <- function(t,x,y){y[1] + y[2] * t}
lamb_par <- c(0.05, 0.01)
mu_par <- c(0.09, 0.001)
historical_temp_bexp_dlin <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)

# Linear speciation wrt temp, exponential extinction wrt temp
f.lamb <- function(t,x,y){y[1] + y[2] * x}
f.mu <- function(t,x,y){y[1] * exp(y[2] * x)}
lamb_par <- c(0.09, 0.001)
mu_par <- c(0.05, 0.01)
historical_temp_blin_dexp <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)

# Linear speciation wrt temp, linear extinction wrt temp
f.lamb <- function(t,x,y){y[1] + y[2] * x}
f.mu <- function(t,x,y){y[1] + y[2] * x}
lamb_par <- c(0.09, 0.001)
mu_par <- c(0.09, 0.001)
historical_temp_blin_dlin <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)

# Exponential speciation wrt temp, exponential extinction wrt temp
f.lamb <- function(t,x,y){y[1] * exp(y[2] * x)}
f.mu <- function(t,x,y){y[1] * exp(y[2] * x)}
lamb_par <- c(0.05, 0.01)
mu_par <- c(0.05, 0.01)
historical_temp_bexp_dexp <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)





# Combined models not used per RPANDA developer advice
#### Time and temperature dependence
#
## Exponential speciation wrt time, linear speciation wrt temperature, constant extinction
#f.lamb <- function(t,x,y){y[1] * exp(y[2] * t) + y[3] + y[4] * x }
#f.mu <- function(t,x,y){y[1]}
#lamb_par <- c(0.05, 0.01, 0.09, 0.001)
#mu_par <- c(0.005)
#historical_temp_bexptim_blintemp_dcst <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)
#
## Exponential speciation wrt time, exponential speciation wrt temperature, constant extinction
#f.lamb <- function(t,x,y){y[1] * exp(y[2] * x) + y[3] * exp(y[4] * t)}
#f.mu <- function(t,x,y){y[1]}
#lamb_par <- c(0.05, 0.01, 0.05, 0.01)
#mu_par <- c(0.005)
#historical_temp_bexptim_bexptemp_dcst <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)
#
## Linear speciation wrt time, linear speciation wrt temperature, constant extinction
#f.lamb <- function(t,x,y){y[1] * y[2] * x + y[3] * t} # Only three terms here because only one intercept is needed
#f.mu <- function(t,x,y){y[1]}
#lamb_par <- c(0.01, 0.05, 0.01)
#mu_par <- c(0.005)
#historical_temp_blintim_blintemp_dcst <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)
#
## Linear speciation wrt time, exponential speciation wrt temperature, constant extinction
#f.lamb <- function(t,x,y){y[1] * exp(y[2] * x) + y[3]+ y[4] * t}
#f.mu <- function(t,x,y){y[1]}
#lamb_par <- c(0.09, 0.001, 0.05, 0.01)
#mu_par <- c(0.005)
#historical_temp_blintim_bexptemp_dcst <- fit_env(tree, tempcurve, 112.99, f.lamb, f.mu, lamb_par, mu_par, df = dof, f = 0.606, dt=1e-3)



######
# Environment-PHENOTYPIC trait model with best-fit diversification model

tree.pheno <- read.nexus("ultrametric_occur_trait_matched_forcedultra.tre")

tempcurve = read.table("~/Desktop/Writings/Saxifragales\ niche\ modeling/dO18_crameretal_2009/cramer_etal_2009_d18O_temperatureEpstein1953.txt", sep = "\t", header = TRUE)
tempcurve$d18O_adj <- NULL
tempcurve$d18O_adj_5pt_average <- NULL
tempcurve = tempcurve[complete.cases(tempcurve), ] # Remove any rows with missing data

tempfile = read.csv("./trait_phylomds_PC1.txt", sep = "\t", row.names=1, header = FALSE)
trait.pheno = tempfile$V2
lapply(trait.pheno, as.numeric)
names(trait.pheno) <- row.names(tempfile)

dof<-smooth.spline(tempcurve[,1], tempcurve[,2])$df # Calculate degrees of freedom following RPANDA manual

historical_temp_trait_model_exp <- fit_t_env(tree.pheno, trait.pheno, tempcurve, error = NA, df = dof, model = "EnvExp", param=c(0.1,0), scale=TRUE)
historical_temp_trait_model_lin <- fit_t_env(tree.pheno, trait.pheno, tempcurve, error = NA, df = dof, model = "EnvLin", param=c(0.1,0), scale=TRUE)

# Compare to null models without environment following Drury et al. 2016 Sys Bio
library(geiger)
fitContinuous(tree.pheno, trait.pheno, model = "BM")
fitContinuous(tree.pheno, trait.pheno, model = "OU")

######
# Environment-NICHE trait model with best-fit diversification model

tree <- read.newick("ultrametric_occur_matched_forcedultra.tre")

tempcurve = read.table("~/Desktop/Writings/Saxifragales\ niche\ modeling/dO18_crameretal_2009/cramer_etal_2009_d18O_temperatureEpstein1953.txt", sep = "\t", header = TRUE)
tempcurve$d18O_adj <- NULL
tempcurve$d18O_adj_5pt_average <- NULL
tempcurve = tempcurve[complete.cases(tempcurve), ] # Remove any rows with missing data

tempfile = read.csv("./niche_phylopca_PC1.txt", sep = "\t", row.names=1, header = FALSE)
trait.env = tempfile$V2
lapply(trait.env, as.numeric)
names(trait.env) <- row.names(tempfile)

dof<-smooth.spline(tempcurve[,1], tempcurve[,2])$df # Calculate degrees of freedom following RPANDA manual

trait.env.scaled = trait.env/1000 # Scaled to avoid likelihood optimization problems

historical_temp_trait_model_exp <- fit_t_env(tree, trait.env.scaled, tempcurve, error = NA, df = dof, model = "EnvExp", param=c(0.1,0), scale=TRUE)
historical_temp_trait_model_lin <- fit_t_env(tree, trait.env.scaled, tempcurve, error = NA, df = dof, model = "EnvLin", param=c(0.1,0), scale=TRUE)

# Compare to null models without environment following PNAS paper
library(geiger)
fitContinuous(tree, trait.env.scaled, model = "BM")
fitContinuous(tree, trait.env.scaled, model = "OU")


#####
# SUBTREE EXTRACTION TO REDO THE ABOVE; RELOAD TREE AND TRAIT EACH TIME AS ABOVE

library(geiger)
# Saxifragaceae
tree = extract.clade(tree, node = findMRCA(tree, tips = c("Heuchera_americana", "Saxifraga_stolonifera")))
#trait.env = treedata(tree, trait.env)$data
# Crassulaceae
tree = extract.clade(tree, node = findMRCA(tree, tips = c("Crassula_helmsii", "Sedum_acre")))
#trait.env = treedata(tree, trait.env)$data
# Hamamelidaceae
tree = extract.clade(tree, node = findMRCA(tree, tips = c("Rhodoleia_championii", "Hamamelis_virginiana")))
#trait.env = treedata(tree, trait.env)$data
# Grossulariaceae
tree = extract.clade(tree, node = findMRCA(tree, tips = c("Ribes_giraldii", "Ribes_nigrum")))
#trait.env = treedata(tree, trait.env)$data
# Haloragaceae
tree = extract.clade(tree, node = findMRCA(tree, tips = c("Glischrocaryon_behrii", "Myriophyllum_aquaticum")))
#trait.env = treedata(tree, trait.env)$data
# Paeoniaceae
tree = extract.clade(tree, node = findMRCA(tree, tips = c("Paeonia_morisii", "Paeonia_brownii")))
#trait.env = treedata(tree, trait.env)$data


#####
# OBJECT LIST

# Time dependence

# Constant speciation, no extinction
result_cst
# Exponential speciation with time, no extinction
result_exp
# Linear speciation with time, no extinction
result_lin
# Exponential speciation with time, constant extinction
result_bexp_dcst
# Linear speciation with time, constant extinction
result_blin_dcst
# Exponential speciation with time, linear extinction
result_bexp_dlin
# Linear speciation with time, linear extinction
result_blin_dlin
# Linear speciation with time, exponential extinction
result_blin_dexp
# Exponential speciation with time, exponential extinction
result_bexp_dexp

# Temperature dependence

# Constant speciation wrt temp, no extinction
historical_temp_bconst_d0
# Exponential speciation wrt temp, no extinction
historical_temp_bexp_d0
# Linear speciation wrt temp, no extinction
historical_temp_blin_d0
# Exponential speciation wrt temp, constant extinction
historical_temp_bexp_dcst
# Linear speciation wrt temp, constant extinction
historical_temp_blin_dcst
# Exponential speciation wrt temp, linear extinction wrt temp
historical_temp_bexp_dlin
# Linear speciation wrt temp, exponential extinction wrt temp
historical_temp_blin_dexp
# Linear speciation wrt temp, linear extinction wrt temp
historical_temp_blin_dlin
# Exponential speciation wrt temp, exponential extinction wrt temp
historical_temp_bexp_dexp
