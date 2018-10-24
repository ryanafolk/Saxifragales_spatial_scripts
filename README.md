# Spatial and trait analyses for Saxifragales
Scripts in this repository assume users have basic familiarity with conversion among common formats (csv to tsv, csv to ESRI shapefile, etc). Where a .sh and .r file have the same file name, the .sh script should be run first. Folders with more than one script are described in their own subsections.

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

* trait_scripts
    * This folder contains scripts for analyses related to phenotypic traits.

* biogeo 
    * This folder contains the script for automatically determining biogeographic coding from shape files, meant to address inflexible and inefficient methods we found elsewhere when we started this project.

* name_resolution
    * Scripts and data related to name scraping and synonymy resolution.


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
    * Ultrametric time-calibrated tree matched with occurrence data, used for diversification and niche BAMM

* ultrametric_occur_trait_matched_forcedultra.tre
    * Ultrametric time-calibrated tree matched with occurrence and trait data (a bit fewer taxa), used for phenotype BAMM
    
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

# BAMM_postprocessing/bootstrap
* diversification_bootstrap.sh and config.txt
    * Scripts and template for generating bootstrapped datasets for diversification BAMM. 

* PCA_bootstrap.sh and PCA_bootstrap.r and config_trait_environmental.txt
    * Scripts and template for generating bootstrapped datasets for niche BAMM. Assumes the environmental data have already been randomly sampled.

* mds_bootstrap.sh and mds_bootstrap.r and config_trait_phenotypic_fixedmissing.txt
    * Scripts and template for generating bootstrapped datasets for phenotype BAMM. Assumes replicate distance matrices have already been generated (see trait_scripts).

* ratethroughtime_bootstrap_plot.sh and ratethroughtime_bootstrap_plot.r
    * Script to pre-calculate rate curves for plotting with plot_BAMM_bootstraps.r

* plot_BAMM_bootstraps.r
    * Script for plotting bootstraps.
    
* time_to_50percentrate.r
    * Script for calculating a boxplot of times to 50% of current rates.
 
* used.trees.environmentmatched.tre 
    * Bootstraps used for diversification and niche BAMM.
     
* used.trees.traitmatched.tre
    * Bootstraps used for phenotype BAMM.

* besttree_averagerates.tsv
    * A table of average rates from BAMM runs on best trees. Used for co-plotting.

# BAMM_alternative_analyses
* ms_rates_and_trait_rates.r
    * This script is for running the MS and OU sigma-squared analyses.
    
* quasse_sim_example.r
    * This script represents one QuaSSE simulation run. Submit this script as independent jobs multiple times to get multiple simulations.
    
* RPANDAS.r
    * RPANDA run script.
    
# trait_scripts
* sax_trait_matrix_process_FINAL_excludemissing_distance_FINAL.py
     * This script does the matrix 

* pcoa_traitdata.r
    * MDS script for trait data

* phenotypic_loadings.r
    * Script for calculating phenotype MDS "loadings"

* Saxifragales trait data sheet.xlsx
     * Original Saxifragales trait dataset

* sax_traits_final_lowmissing.txt
     * Final Saxifragales trait dataset, taxa excluded as described in Methods.

* Trait_term_reconciliation.xlsx
     * Summary of trait synonymies coded into sax_trait_matrix_process_FINAL_excludemissing_distance_FINAL.py

# name_resolution
* FINAL_combined_cat_script_nomenclature.sh
    * Final list of concatenation instructions for taxa based on the extracted Excel sheets of synonymies in this folder, with the priority order noted in the text
    
* final_crassbooklist.xlsx
    * Extracted synonyms from the Illustrated Handbook of Succulent Plants: Crassulaceae. Eggli Ed.

* FNA_all_no_crassulaceae.xlsx
    * Extracted synonyms from the Flora of North America eFloras.org website
    
* All_FOC_nocrassulaceae.xlsx
    * Extracted synonyms from the Flora of China eFloras.org website

* TPL_allname_list_fixed_nocrassulaceae.xlsx
    * Extracted synonyms from The Plant List.
