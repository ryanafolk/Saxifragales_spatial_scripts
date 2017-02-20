# Loop script for extracting environmental values from occurrence recoreds
# Does NOT work when there is a header line!! Use sed -i '1d' *.tsv.final after making a copy

mkdir pnos_directsampling
for f in *.tsv.final; do 
g=$(sed 's/.tsv.final//g' <<< $f); 
echo ${f}; 
for i in ./clipped_layers/${g}/*.asc; do
./extract_pointvalues.py ${f} ${i} 
done
done

# Backwards glob version

mkdir pnos_directsampling
for f in `ls -r *.tsv.final`; do 
g=$(sed 's/.tsv.final//g' <<< $f); 
echo ${f}; 
for i in ./clipped_layers/${g}/*.asc; do
./extract_pointvalues.py ${f} ${i} 
done
done