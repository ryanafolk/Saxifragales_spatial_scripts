# Spatial and trait analyses for Saxifragales
Scripts in this repository assume users have basic familiarity with conversion among common formats (csv to tsv, csv to shapefile, etc). Where a .sh and .r file have the same file name, the .sh script should be run first.

* Extract_point_values
    * This folder contains the script we optimized to extract environmental conditions from large point datasets.

* BAMM 
    * This folder contains basic BAMM run input files (including trees and trait data) and scripts.

* BAMM_postprocessing 
    * This folder contains various post-processing scripts, such as producing rate-through-time plots and boxplots.

* BAMM_postprocessing/bootstrap
    * This folder contains scripts related to executing and summarizing BAMM runs over a distribution of trees and (where appropriate) trait values.

* biogeo 
    * This folder contains the script for automatically determining biogeographic coding from shape files. It is an improvement over inflexible and inefficient methods we found elsewhere.
