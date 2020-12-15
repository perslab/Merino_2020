#!/bin/bash 
cd data
mkdir esmu
cd esmu

wget https://github.com/perslab/timshel-2020/raw/master/out/es/campbell2017_lvl1.mu.csv.gz
wget https://github.com/perslab/timshel-bmicelltypes/raw/master/out/es/campbell2017_lvl2.mu.csv.gz
wget https://github.com/perslab/timshel-2020/raw/master/out/es/chen2017.mu.csv.gz
wget https://github.com/perslab/timshel-2020/raw/master/out/es/kimVMH2019_10x.mu.csv.gz
wget https://github.com/perslab/timshel-2020/raw/master/out/es/kimVMH2019_smartseq.mu.csv.gz
wget https://github.com/perslab/timshel-2020/raw/master/out/es/mikkelsen2019.mu.csv.gz
wget https://github.com/perslab/timshel-2020/raw/master/out/es/moffitt2018.mu.csv.gz
wget https://github.com/perslab/timshel-2020/raw/master/out/es/romanov2017.mu.csv.gz
wget https://github.com/perslab/timshel-bmicelltypes/raw/master/out/es/tabula_muris.mu.csv.gz
wget https://github.com/perslab/timshel-bmicelltypes/raw/master/out/es/mousebrain.mu.csv.gz

cd ../..
