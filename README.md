# Spatial and trait analyses for Saxifragales
Scripts in this repository assume users have basic familiarity with conversion among common formats (csv to tsv, csv to shapefile, etc). Where a .sh and .r file have the same file name, the .sh script should be run first. Folders with more than one script are described in their own subsections.

* Extract_point_values
    * This folder contains the script we optimized to extract environmental conditions from large point datasets.

* BAMM 
    * This folder contains basic BAMM run input files (including trees and trait data) and scripts.

* BAMM_postprocessing 
    * This folder contains various post-processing scripts, such as producing rate-through-time plots and boxplots.

* BAMM_postprocessing/bootstrap
    * This folder contains scripts related to executing and summarizing BAMM runs over a distribution of trees and (where appropriate) trait values.

* BAMM_alternative_analyses
    * This is a folder for non-BAMM analyses, such as MS, QuaSSE, etc.

* biogeo 
    * This folder contains the script for automatically determining biogeographic coding from shape files. It is an improvement over inflexible and inefficient methods we found elsewhere.

# BAMM 
* config.txt
    * BAMM configure script for diversification
    
* config_trait_environmental.txt
    * BAMM configure script for niche rate  

* config_trait_phenotypic_fixedmissing.txt
    * BAMM configure script for phenotype rate

* niche_phylopca_PC1.txt
    * First axis of niche PCA    

* trait_phylomds_PC1.txt
    * First axis of phenotype MDS

* sample_fractions.txt
    * Sampling fractions for families used in BAMM

* ultrametric_occur_matched_forcedultra.tre
    * Tree matched with occurrence data, used for diversification and niche BAMM

* ultrametric_occur_trait_matched_forcedultra.tre
    * Tree matched with occurrence and trait data (a bit fewer taxa), used for phenotype BAMM
    
# BAMM_postprocessing 
* bammtools_diversification.R
    * Standard workflow for processing BAMM diversification run. Note this is mostly a template for an interactive session, and not all analyses were run or used for the final paper.
    
* bammtools_trait.R
    * Standard workflow for processing BAMM niche and phenotype run. File paths refer to niche data; those for phenotype data can be found in commented lines. Note this is mostly a template for an interactive session, and not all analyses were run or used for the final paper.

* plot_ratecurves_together.R
    * This is the plotting function for Fig. 2. Some post-processing in a vector graphics program will be needed.

* cladewise_plots.r
    * Script to generate rate plots for all of the non-monotypic families in each of diversification, niche, and phenotype. These plots were colored by ancestral temperature values, Hex codes for which are hard-coded in the script.
    
* plot_ratecurves_together_cladewise.R
    * In contrast to cladewise_plots.r, this is a function to generate rate plots for families such as in Fig. 3, co-plotted by taxon rather than rate type.
    
 * subclade_shifttimes.r
     * This script generates box plots for rate shift times for select families, as in Fig. 3, rather than whole-tree box plots.
    
* climatic_variability_analysis.r
    * This script includes analyses to ingest Zachos 2001 temperature data (the path should be adjusted as necessary), generate windowed climate variability, and run models.

* extract_tip_rates.r and tip_rate_density_plots.r    
    * These scripts calculate tip rates for diversification, niche, and phenotype, and make density plots such as in Fig. 1.


# BAMM_alternative_analyses
* ms_rates_and_trait_rates.r
    * This script is for running the MS and OU sigma-squared analyses.
    
* quasse_sim_example.r
    * This script represents one QuaSSE simulation run. Submit this script as independent jobs multiple times to get multiple simulations.
