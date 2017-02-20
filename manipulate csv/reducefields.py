#!/usr/bin/env python3

# A program to reduce a csv to arbitrary column names, line-by-line.
# For instance, ./reducefields.py input.in output.out -l continent countryCode locality decimalLatitude decimalLongitude genus specificEpithet

import csv # To process tab-delimited files
import argparse # Parse arguments

parser = argparse.ArgumentParser(description='Script to delete unnecessary fields in locality documets that are tab-delimited and follow DarwinCore header terms.')
parser.add_argument('input_file', action='store', help='Name of the desired input file.')
parser.add_argument('output_file', action='store', help='Name of the desired output file.')
parser.add_argument('-l','--list', nargs='+', help='List of DarwinCore fields to preserve.', required=True)
args = parser.parse_args()

keptcolumnnames = args.list
keptcolumnindices = []

try: # Reads first line only for DarwinCore terms, finds column indices
	with open(args.input_file, 'r') as datafile:
		reader=csv.reader(datafile, delimiter='\t')
		row1 = next(reader) # First row only
except:
	print("Could not open file.")

print("Order of input fields will be ignored; output order will follow source data.")
print("Names of the kept columns:")
print(keptcolumnnames)
	
for item in keptcolumnnames:
	keptcolumnindices.append(row1.index(item))
keptcolumnindices.sort()

print("Indices of the kept columns:")
print(keptcolumnindices)

deletedcolumnindices = list(range(len(row1)))
for E in keptcolumnindices:
	deletedcolumnindices.remove(E)

with open(args.input_file, 'r') as datafile:
	reader=csv.reader((line.replace('\0','') for line in datafile),delimiter='\t',quoting=csv.QUOTE_NONE) # This line is critical as null bytes occur in GBIF CSVs, and quotes cause field limit errors
	with open(args.output_file, 'w+') as writefile:
		writer = csv.writer(writefile, delimiter='\t')
		for r in reader:
			for E in sorted(deletedcolumnindices, reverse=True): # Reverse so that indices to be deleted are not changed by deletion of other elements
				del r[E]
			writer.writerows([r]) # The syntax on this line was problematic in terms of iteration behavior
