# make sure tree bootstraps and environmental data bootstraps are in the directory

# Make phyloMDS files
for ((i=0; i<=9; i++)); do
sed "s/XXX/0${i}/g" mds_bootstrap.r > mds_bootstrap.0${i}.r
R CMD BATCH mds_bootstrap.0${i}.r
done

for ((i=10; i<=49; i++)); do
sed "s/XXX/${i}/g" mds_bootstrap.r > mds_bootstrap.${i}.r
R CMD BATCH mds_bootstrap.${i}.r
done

# Make PC1 axis files and clean them up
for ((i=0; i<=9; i++)); do
cut -f 1-2 trait_phylomds_boot0${i}.txt | sed '1d' | sed 's/"//g' > trait_phylomds_PC1_boot0${i}.txt
done

for ((i=10; i<=49; i++)); do
cut -f 1-2 trait_phylomds_boot${i}.txt | sed '1d' | sed 's/"//g' > trait_phylomds_PC1_boot${i}.txt
done

# In batch force ultrametric bootstraps -- important because branches are just slightly off
for ((i=0; i<=9; i++)); do
sed "s/XXX/0${i}/g" force_ultrametric_batch.r > force_ultrametric_batch.0${i}.r
R CMD BATCH force_ultrametric_batch.0${i}.r
done

for ((i=10; i<=49; i++)); do
sed "s/XXX/${i}/g" force_ultrametric_batch.r > force_ultrametric_batch.${i}.r
R CMD BATCH force_ultrametric_batch.${i}.r
done

# Make config files -- the prior settings will be barely different, so we will use priors from main analysis
for ((i=0; i<=9; i++)); do
sed "s/XXX/0${i}/g"  config_trait_phenotypic_fixedmissing.txt > config_trait_phenotypic_fixedmissing.0${i}.txt
done

for ((i=10; i<=49; i++)); do
sed "s/XXX/${i}/g"  config_trait_phenotypic_fixedmissing.txt > config_trait_phenotypic_fixedmissing.${i}.txt
done

# Move to subdirectories for BAMM

for ((i=0; i<=9; i++)); do
mkdir rep_0${i}
mv bootstrap_sample.traitmatched.forcedultra.0${i}.tre rep_0${i}
mv trait_phylomds_PC1_boot0${i}.txt rep_0${i}
mv config_trait_phenotypic_fixedmissing.0${i}.txt rep_0${i}
done

for ((i=10; i<=49; i++)); do
mkdir rep_${i}
mv bootstrap_sample.traitmatched.forcedultra.${i}.tre rep_${i}
mv trait_phylomds_PC1_boot${i}.txt rep_${i}
mv config_trait_phenotypic_fixedmissing.${i}.txt rep_${i}
done
