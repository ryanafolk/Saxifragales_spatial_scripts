#!/usr/bin/env python
# Script to automate training region development
# MUST BE PYTHON 2

# Order of loading the modules matters!!!
# Longitude must be header "x" and latitude header "y" -- DarwinCore too long for 10 character limit on shapefile field headers

# Run like:
# for f in *.csv; do ./training_regions.py ${f} /Users/Fasch/Desktop/Heuchera_occurrences_test/terr-ecoregions-TNC/tnc_terr_ecoregions.shp; done
# for f in *.csv; do if [ ! -f "${f}.final_shapefile.shp" ]; then ./training_regions.py ${f} /Users/Fasch/Desktop/Heuchera_occurrences_test/terr-ecoregions-TNC/tnc_terr_ecoregions.shp; fi; done

# Occasionally qgis suffers from memory management issues when run with the API, so run this last line repeatedly until all final files are populated and the line does nothing
# It may help to ensure qgis is closed


# Initialize modules

from qgis.core import *
from qgis.analysis import *

import csv # To process tab-delimited files
import argparse # Parse arguments
import os
import sys
sys.path.append('/Applications/QGIS.app/Contents/Resources/python/')
sys.path.append('/Applications/QGIS.app/Contents/Resources/python/plugins')
import processing
from processing.core.Processing import Processing

os.system("export PYTHONPATH=/Applications/QGIS.app/Contents/Resources/python/:export PYTHONPATH=/Applications/QGIS.app/Contents/Resources/python/plugins/:Applications/QGIS.app/Contents/Resources/python/plugins/processing")


# Create a reference to the QgsApplication; setting the second argument to False disables the GUI
qgs = QgsApplication([], True) # Must be True but no GUI will open
# Standard initialization of qGIS without GUI
# Supply path to qgis install location
QgsApplication.setPrefixPath("/Applications/QGIS.app/Contents/MacOS", True)
# Load providers
qgs.initQgis()
print QgsApplication.showSettings()

Processing.initialize()
Processing.updateAlgsList()


# Program code STARTS HERE

parser = argparse.ArgumentParser(description='Script to automatically develop shape files for training regions.')
parser.add_argument('input_file', action='store', help='Name of the desired input file.') 
parser.add_argument('input_ecoregions', action='store', help='Name of the desired ecoregion shapefile.') # MUST BE ABSOLUTE PATH
# parser.add_argument('-l','--list', nargs='+', help='List of layer files.', required=True)
args = parser.parse_args()

dir_path = os.getcwd()

print "Current file is {0}/{1}.".format(dir_path, args.input_file)

# Load external files
uri = "file://{0}/{1}?delimiter=%s&xField=%s&yField=%s".format(dir_path, args.input_file) % (",", "x", "y") # Specifies tab-delimited; path must be html style
occurrence_layer = QgsVectorLayer(uri, "occurrences", "delimitedtext")
if not occurrence_layer.isValid():
    print "Layer failed to load!"
else:
    print "Layer was loaded successfully!"

# Write occurrences to shape file for join function later
QgsVectorFileWriter.writeAsVectorFormat(occurrence_layer, "{0}.occurrences.shp".format(args.input_file), "utf-8", None, "ESRI Shapefile")

ecoregion_layer = QgsVectorLayer(args.input_ecoregions, "ecoregions", "ogr") # Not used

print "Calculating convex hull"
geometryanalyzer = QgsGeometryAnalyzer()
geometryanalyzer.convexHull(occurrence_layer, "{0}.convex_hull.shp".format(args.input_file), False, -1, p=None)

convex_hull = QgsVectorLayer("{0}.convex_hull.shp".format(args.input_file), "convexhull", "ogr")

print "Calculating buffered convex hull"
geometryanalyzer.buffer(convex_hull, "{0}.convex_hull_buffer.shp".format(args.input_file), 0.5, False, False, -1, p=None)

convex_hull_buffer = QgsVectorLayer("{0}.convex_hull_buffer.shp".format(args.input_file), "convexhull_buffer", "ogr")

print "Harvesting contained ecoregions"
processing.runalg("qgis:joinattributesbylocation", args.input_ecoregions, "{0}.occurrences.shp".format(args.input_file), u'intersects', 0, 1, "mean", 0, "{0}.contained_ecoregions.shp".format(args.input_file))

contained_ecoregions = QgsVectorLayer("{0}.contained_ecoregions.shp".format(args.input_file), "contained_ecoregions", "ogr")

print "Calculate the intersection"
overlaynalyzer = QgsOverlayAnalyzer()
overlaynalyzer.intersection(contained_ecoregions, convex_hull_buffer, "{0}.final_shapefile.shp".format(args.input_file))


# When your script is complete, call exitQgis() to remove the provider and
# layer registries from memory
qgs.exitQgis()
