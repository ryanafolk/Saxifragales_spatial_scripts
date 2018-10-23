for ((i=0; i<=9; i++)); do
sed "s/XXX/0${i}/g" ratethroughtime_bootstrap_plot.r > ratethroughtime_bootstrap_plot.0${i}.r
R CMD BATCH ratethroughtime_bootstrap_plot.0${i}.r
done

for ((i=10; i<=49; i++)); do
sed "s/XXX/${i}/g" ratethroughtime_bootstrap_plot.r > ratethroughtime_bootstrap_plot.${i}.r
R CMD BATCH ratethroughtime_bootstrap_plot.${i}.r
done
