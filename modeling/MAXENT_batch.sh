# Script for batch runs of Maxent in a bash shell
# Assumes that the species names in the occurrence files are the same as the entry in the species column within the files

for f in *.tsv.final; do
	f=$(sed 's/.tsv.final//g' <<< $f)
	echo ${f}
	mkdir ${f}_model
	java -mx2000m -jar maxent.jar nowarnings noprefixes responsecurves jackknife "outputdirectory=./${f}_model" "projectionlayers=./projection_layers" "samplesfile=./${f}.tsv.final" "environmentallayers=./clipped_layers/${f}" randomseed noaskoverwrite randomtestpoints=25 replicates=10 replicatetype=bootstrap noextrapolate maximumiterations=5000 allowpartialdata autorun
	done