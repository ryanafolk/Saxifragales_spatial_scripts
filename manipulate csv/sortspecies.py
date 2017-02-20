#!/usr/bin/env python3

# A program to reduce a csv to arbitrary column names, line-by-line.
# For instance, ./ reducefields.py input.in output.out -l countryCode genus specificEpithet

import csv # To process tab-delimited files
import argparse # Parse arguments
import os

parser = argparse.ArgumentParser(description='Script to delete unnecessary fields in locality documets that are tab-delimited and follow DarwinCore header terms.')
parser.add_argument('input_file', action='store', help='Name of the desired input file.')
parser.add_argument('output_directory', action='store', help='Name of the desired output directory.')
parser.add_argument('-l','--list', nargs='+', help='List of DarwinCore fields to check for emptyness.', required=True)
args = parser.parse_args()

# genus specificEpithet are the DarwinCore fields

checkcolumnnames = args.list
checkcolumnindices = []

try: # Reads first line only for DarwinCore terms, finds column indices
	with open(args.input_file, 'r') as datafile:
		reader=csv.reader(datafile, delimiter='\t')
		row1 = next(reader) # First row only
except:
	print("Could not open file.")

print("Order of input fields will be ignored; output order will follow source data.")
print("Names of the checked columns:")
print(checkcolumnnames)
	
for item in checkcolumnnames:
	checkcolumnindices.append(row1.index(item))
checkcolumnindices.sort()

print("Indices of the checked columns:")
print(checkcolumnindices)

# Read input file for all species name entries
speciesname = []
with open(args.input_file, 'r') as datafile:
	reader=csv.reader((line.replace('\0','') for line in datafile),delimiter='\t',quoting=csv.QUOTE_NONE) # This line is critical as null bytes occur in GBIF CSVs, and quotes cause field limit errors
	for r in reader:
		speciesname.append([r[checkcolumnindices[0]], r[checkcolumnindices[1]]])

# Remove duplicates in species names (stored as list of two)
speciesnamereduced = []
for i in speciesname:
	if i not in speciesnamereduced:
		if i[0] != checkcolumnnames[0] and i[1] != checkcolumnnames[1]:
			speciesnamereduced.append(i)
print(speciesnamereduced)

directory = args.output_directory # Make subdirectory for output
if not os.path.exists(directory):
    os.makedirs(directory)

# Write entries for each species in a new csv

genusindex = checkcolumnindices[0]
speciesindex = checkcolumnindices[1]
for i in speciesnamereduced:
	with open(args.input_file, 'r') as datafile:
		reader=csv.reader((line.replace('\0','') for line in datafile),delimiter='\t',quoting=csv.QUOTE_NONE) # This line is critical as null bytes occur in GBIF CSVs, and quotes cause field limit errors
		with open('./{0}/{1}_{2}.tsv'.format(directory,i[0], i[1]), 'w+') as writefile:
			writer = csv.writer(writefile, delimiter='\t')
			writer.writerow(row1)
			for r in reader:
				if str(i[0]) == str(r[checkcolumnindices[0]]) and str(i[1]) == str(r[checkcolumnindices[1]]):
					writer.writerow(r)

		
