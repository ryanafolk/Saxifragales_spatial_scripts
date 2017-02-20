# Batch clipping of raster files based on a shapefile
# Have all final shapefiles in "shapefiles" directory
# Do not copy/paste for very large numbers of files

mkdir ./clipped_layers/
for f in *.tsv.final; do
	f=$(sed 's/.tsv.final//g' <<< $f)
	echo ${f}
	mkdir ./clipped_layers/${f}/
	echo '#!/usr/bin/env Rscript' > ${f}_clip.r
	echo 'library(raster)' >> ${f}_clip.r
	echo 'library(maptools)' >> ${f}_clip.r
	echo 'source("./CropRaster.r")' >> ${f}_clip.r
	for i in ./source_layers/*.asc; do
		echo "CropRaster(filelist='${i}',  ShapeFile = './shapefiles/${f}.tsv.final.final_shapefile.shp', sufix = '_clipped')" >> ${f}_clip.r
		done
	chmod a+x ${f}_clip.r
	./${f}_clip.r
	mv ./source_layers/*_clipped* ./clipped_layers/${f}/
	rename 's/_clipped//g' ./clipped_layers/${f}/*
	done


