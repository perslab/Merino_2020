#!/bin/bash 
mkdir data/munged_sumstats

python CELLECT/ldsc/mtag_munge.py \
--sumstats data/sumstats/DietGwas_UpdatedResults_20200520/meta_pro_CHARGE_UKBB1_noindels_rsid_dbsnp153.txt \
--merge-alleles CELLECT/data/ldsc/w_hm3.snplist \
--n-value 283119 \
--keep-pval \
--snp "name" \
--p "P-Value" \
--a1 "Allele1" \
--a2 "Allele2" \
--signed-sumstats "Z",0 \
--ignore "MarkerName" \
--out data/munged_sumstats/pro

python CELLECT/ldsc/mtag_munge.py \
--sumstats data/sumstats/DietGwas_UpdatedResults_20200520/meta_carb_CHARGE_UKBB1_noindels_rsid_dbsnp153.txt \
--merge-alleles CELLECT/data/ldsc/w_hm3.snplist \
--n-value 283119 \
--keep-pval \
--snp "name" \
--p "P-Value" \
--a1 "Allele1" \
--a2 "Allele2" \
--signed-sumstats "Z",0 \
--ignore "MarkerName" \
--out data/munged_sumstats/carb

python CELLECT/ldsc/mtag_munge.py \
--sumstats data/sumstats/DietGwas_UpdatedResults_20200520/meta_fat_CHARGE_UKBB1_noindels_rsid_dbsnp153.txt \
--merge-alleles CELLECT/data/ldsc/w_hm3.snplist \
--n-value 283119 \
--keep-pval \
--snp "name" \
--p "P-Value" \
--a1 "Allele1" \
--a2 "Allele2" \
--signed-sumstats "Z",0 \
--ignore "MarkerName" \
--out data/munged_sumstats/fat