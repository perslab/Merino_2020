## Clone this repo
Open a shell and run the following command to clone the repo from github and then enter the directory.
```
git clone https://github.com/perslab/Merino_2020.git
cd Merino_2020
```

## CELLECT setup

### Clone the CELLECT repo
Clone the repo 
```
git clone --recurse-submodules https://github.com/perslab/CELLECT.git
```
Checkout the exact version of CELLECT used for this analysis
```
cd CELLECT
git checkout 90ba133
```

### LDSC sumstats munge

Set up a virtual environment to run the LDSC munging script, then activate the environment. This is required to get sumstats files in the right format. Please note that you must first obtain and place the the sumstats files in the `data/DietGwas_UpdatedResults_20200520/` directory before running this step.
```
conda env create -f ldsc/environment_munge_ldsc.yml # creates 'munge_ldsc' environment 
conda activate munge_ldsc
```
Each of the sumstats files must be passed through the munging script, which will then output into `data/munged_sumstats/`. These commands are wrapped in `scripts/munge_sumstats.sh` and are executed by running that script.
```
./scripts/munge_sumstats.sh
```
If the scripts execute successfully, they will produce three `.sumstats.gz` and `.log` files for each sumstats file.
```
data/munged_sumstats/
├── carb.log
├── carb.sumstats.gz
├── fat.log
├── fat.sumstats.gz
├── pro.log
└── pro.sumstats.gz
```

Once this is done, deactivate the environment used to munge the sumstats
```
conda deactivate
```

### Download expression specificty files
CELLECT requires expression specificity files generated by CELLEX to prioritize cell types. A number of these are precomputed and available at https://github.com/perslab/timshel-2020/tree/master/out/es. A shell script `scripts/download_esmu_files.sh` is made available to download the ones used in this analysis. Run:
```
./scripts/download_esmu_files.sh
```
Upon successful execution the files can be found in `data/esmu/`.


## Run CELLECT
In order to run CELLECT we need to create an environment and install snakemake into it.
```
conda create -n cellect python=3.8 snakemake">=5.27.4" -c bioconda -c conda-forge
```
Activate the environment
```
conda activate cellect
```
Enter the CELLECT repo
```
cd CELLECT
```
From here, we can execute CELLECT-LDSC with the provided file in `../config/`. These specify how CELLECT should be run, pointing it to the relevant sumstats and expression specificty files. The results will be in `../results/cellect_ldsc/`. The `-j` flag specifies we'll run the pipeline using 4 cores, which can be scaled up or down depending on your hardware.
```
snakemake --use-conda -j 4 -s cellect-ldsc.snakefile --configfile ../config/config-ldsc-dietpref_merino20200511.yml
```
Additionally, an analysis may be performed with CELLECT-MAGMA using the appropriate configuration file. The output will be in `../results/cellect_magma/`
```
snakemake --use-conda -j 4 -s cellect-ldsc.snakefile --configfile ../config/config-magma-dietpref_merino20200511.yml
```
The results in the `prioritization.csv` file at `results/CELLECT-LDSC/results/prioritization.csv` give a p-value for showing the priority of each cell type within a dataset. These p-values are *not* corrected for multiple hypothesis testing.


## Multiple hypothesis testing correction
A script is provided to perform multiple hypothesis correction for CELLECT-LDSC. It can be found at `scripts/correct_cellect_ldsc.py` and will output a `prioritization_corrected.csv` file appending Benjamini-Hochberg and Bonferroni corrected p-values.

