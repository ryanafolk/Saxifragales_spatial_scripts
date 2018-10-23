# Make config files -- the prior settings will be barely different, so we will use priors from main analysis
for ((i=0; i<=9; i++)); do
sed "s/XXX/0${i}/g"  config.txt > config.0${i}.txt
done

for ((i=10; i<=49; i++)); do
sed "s/XXX/${i}/g"  config.txt > config.${i}.txt
done

# Move to subdirectories for BAMM

for ((i=0; i<=9; i++)); do
mkdir rep_0${i}
mv bootstrap_sample.forcedultra.0${i}.tre rep_0${i}
mv config.0${i}.txt rep_0${i}
cp sample_fractions.txt rep_0${i}
done

for ((i=10; i<=49; i++)); do
mkdir rep_${i}
mv bootstrap_sample.forcedultra.${i}.tre rep_${i}
mv config.${i}.txt rep_${i}
cp sample_fractions.txt rep_${i}
done
