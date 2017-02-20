# Batch calculation of PNOs
# Uses trimmed training regions against average of model bootstraps for PNO calculation (same as Heuchera paper)

mkdir ./pnos/
for f in *.tsv.final; do
	f=$(sed 's/.tsv.final//g' <<< $f)
	echo ${f}
	echo '#!/usr/bin/env Rscript' > ${f}_pno.r
	echo 'library(phyloclim)' >> ${f}_pno.r
	mkdir ./${f}_model/layerforpno/
	cp ./${f}_model/${f}_avg.asc ./${f}_model/layerforpno/
	sed -i "s/ncols         /NCOLS /" ./${f}_model/layerforpno/*.asc
	sed -i "s/nrows         /NROWS /" ./${f}_model/layerforpno/*.asc
	sed -i "s/xllcorner     /XLLCORNER /" ./${f}_model/layerforpno/*.asc
	sed -i "s/yllcorner     /YLLCORNER /" ./${f}_model/layerforpno/*.asc
	sed -i "s/cellsize      /CELLSIZE /" ./${f}_model/layerforpno/*.asc
	sed -i "s/NODATA_value  /NODATA_value /" ./${f}_model/layerforpno/*.asc
	for i in ./source_layers/*.asc; do
		j=$(sed 's/.*\///g' <<< $i)
		j=$(sed 's/\.asc//g' <<< $j)
		echo "${j}_pno = pno(path_bioclim = './clipped_layers/${f}/${j}.asc', path_model = './${f}_model/layerforpno/', bin_number = 50)" >> ${f}_pno.r
		echo "write.csv(${j}_pno, file = './pnos/${j}_pno_${f}.csv')" >> ${f}_pno.r
		done
	chmod a+x ${f}_pno.r
	./${f}_pno.r
	done

