#!/usr/bin/env python3

# A program to generate reduced columns in Maxent-ready format
# For instance, ./reducefields.py input.in output.out -l dwc:genus dwc:specificEpithet dwc:decimalLongitude dwc:decimalLatitude

import csv # To process tab-delimited files
import argparse # Parse arguments
import os

parser = argparse.ArgumentParser(description='Script to delete unnecessary fields in locality documets that are tab-delimited and follow DarwinCore header terms.')
parser.add_argument('input_file', action='store', help='Name of the desired input file.')
parser.add_argument('output_file', action='store', help='Name of the desired output file.')
parser.add_argument('-l','--list', nargs='+', help='List of DarwinCore fields to preserve.', required=True) # Order sensitive
args = parser.parse_args()

with open(args.input_file, 'r') as datafile:
	reader=csv.DictReader((line.replace('\0','') for line in datafile),delimiter='\t',quoting=csv.QUOTE_NONE) # This line is critical as null bytes occur in GBIF CSVs, and quotes cause field limit errors
	with open("{0}.temp".format(args.output_file), 'w+') as writefile:
		fieldnames = args.list
		writer = csv.DictWriter(writefile, delimiter='\t', fieldnames=fieldnames, extrasaction='ignore')
		writer.writeheader()
		for r in reader:
			writer.writerows([r]) # The syntax on this line was problematic in terms of iteration behavior

with open("{0}.temp".format(args.output_file), 'r') as datafile:
	reader=csv.reader((line.replace('\0','') for line in datafile),delimiter='\t',quoting=csv.QUOTE_NONE) # This line is critical as null bytes occur in GBIF CSVs, and quotes cause field limit errors
	with open(args.output_file, 'w+') as writefile:
		writer = csv.writer(writefile, delimiter='\t')
		for r in reader:
			r[0:2] = ['_'.join(r[0:2])]
			writer.writerows([r]) # The syntax on this line was problematic in terms of iteration behavior

os.system("rm {0}.temp".format(args.output_file))
os.system("sed -i 's/dwc:genus_dwc:specificEpithet/Species/g' {0}".format(args.output_file))
os.system("sed -i 's/dwc:decimalLongitude/x/g' {0}".format(args.output_file))
os.system("sed -i 's/dwc:decimalLatitude/y/g' {0}".format(args.output_file))
