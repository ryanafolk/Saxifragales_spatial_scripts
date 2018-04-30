#!/usr/bin/env python3
# Script to automate biogeographic coding
# Adapted from training region development code

# Points should already be ESRI shape files
# Run like:
'''
python3 -u biogeo_coding_ogr.py saxifragales_simple_seven_regions.shp -p *.shp > BIOGEOCODING.txt
python3 -u biogeo_coding_ogr.py saxifragales_simple_seven_regions.shp -p $(ls -r *.shp) > reverse_BIOGEOCODING.txt
#The u is to prevent buffering
'''

import os
import sys
import csv # To process tab-delimited files
import argparse # Parse arguments
from osgeo import ogr
import fiona # Simplifies shape file input output
from shapely.geometry import shape
from shapely import geometry
import shapely
from rtree import index


parser = argparse.ArgumentParser(description='Script to automatically develop shape files for training regions.')
parser.add_argument('-p', '--input_points', nargs='+', default=[], help='List of names of the desired input files.')
parser.add_argument('input_ecoregions', action='store', help='Name of the desired ecoregion shapefile.') # MUST BE ABSOLUTE PATH
args = parser.parse_args()

# Spatial indexing of ecoregion layer.
# This step is critical; naively iterating through ecoregions increases calculation time by orders of magnitude.
print("Indexing ecoregions.")
ecoregions_fixed = [pol for pol in fiona.open(args.input_ecoregions)]
from rtree import index
idx = index.Index()
for pos, poly in enumerate(ecoregions_fixed):
	idx.insert(pos, shape(poly['geometry']).bounds)

print("Done indexing ecoregions.")

print("Finding intersections.")
 
for point in args.input_points:  
	print("Current file is {0}.".format(point))
	points_fixed = [pt for pt in fiona.open(point)] # Import points (already as an ESRI shapefile)
	eco_shapes = []    
	for i,pt in enumerate(points_fixed): # Iterate over points
		point = shape(pt['geometry'])
		for j in idx.intersection(point.coords[0]): # Iterate through spatial index of ecoregions if there is a chance for a match.
			if point.within(shape(ecoregions_fixed[j]['geometry'])): # If the point is in the ecoregion...
				eco_shapes.append(shape(ecoregions_fixed[j]['geometry'])) # ...we take the ecoregion.
	    
	eco_shapes_reduced = []
	for eco_shape in eco_shapes: # Take only unique items (dictionary method); otherwise have duplicates
	    if eco_shape not in eco_shapes_reduced:
	        eco_shapes_reduced.append(eco_shape)
	
	print("Number of regions occupied: {0}".format(len(eco_shapes_reduced))) 
	
	for eco_shape in eco_shapes_reduced:
		print(eco_shape.centroid.wkt)

## Print types (there should be no GeometryCollections -- would indicate lack of intersection which should not happen
## Number of items should be number of unique ecoregions contained
#for f in final_shape:
#	print(type(f))
