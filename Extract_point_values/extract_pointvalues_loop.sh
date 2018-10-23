# Loop script for extracting environmental values from occurrence recoreds
# Does NOT work when there is a header line!! Use sed -i '1d' *.tsv.final after making a copy

# mkdir pnos_directsampling
# for f in *.tsv.final; do 
# g=$(sed 's/.tsv.final//g' <<< $f); 
# echo ${f}; 
# for i in ./clipped_layers/${g}/*.asc; do
# ./extract_pointvalues.py ${f} ${i} 
# done
# done
# 
# # Backwards glob version
# 
# mkdir pnos_directsampling
# for f in `ls -r *.tsv.final`; do 
# g=$(sed 's/.tsv.final//g' <<< $f); 
# echo ${f}; 
# for i in ./clipped_layers/${g}/*.asc; do
# ./extract_pointvalues.py ${f} ${i} 
# done
# done
# 
# # Saxifragales final version
# 
# mkdir aaa_pnos_directsampling
# for f in *.tsv.maxent; do 
# g=$(sed 's/.tsv.maxent//g' <<< $f); 
# echo ${f}; 
# for i in /Volumes/Boismortier/Saxifragales_all_layers_30s/*.asc; do
# ./extract_pointvalues.py ${f} ${i} 
# done
# done
# 
#########

# Saxifragales final version high throughput

# No point associations between PNOs, no missing values
mkdir pnos_directsampling
for i in ./../Saxifragales_all_layers_30s/*.asc; do
./extract_pointvalues_highthroughput.py ${i} -l *.tsv.maxent
done

# Point association between PNOs, with missing values
mkdir pnos_directsampling_with_missing_data
for i in ./../Saxifragales_all_layers_30s/*.asc; do
./extract_pointvalues_highthroughput_with_missing_data.py ${i} -l *.tsv.maxent
done

# This one drops only the missing values for each point, so point associations are lost
mkdir pnos_directsampling_no_missing_data_no_point_associations
for i in ./../Saxifragales_all_layers_30s/*.asc; do
./extract_pointvalues_highthroughput_with_missing_data_removed_use_this.py ${i} -l *.tsv.maxent
done

