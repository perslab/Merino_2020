import pandas as pd
import numpy as np
from statsmodels.stats.multitest import multipletests

df = pd.read_csv('results/CELLECT-LDSC/results/prioritization.csv')
dfg = df.groupby(['gwas', 'specificity_id'])
for g in dfg.groups:
    idx = dfg.groups[g]
    pvals = df.loc[idx]['pvalue']
    for m in ['fdr_bh', 'bonferroni']:
        df.loc[idx, m] = multipletests(pvals, 0.05, method=m)[1]
dfg.apply(lambda x: multipletests(x['pvalue'], 0.05, method='fdr_bh')[1])
dfg.apply(lambda x: multipletests(x['pvalue'], 0.05, method='bonferroni')[1])
df = df[df['specificity_id'] != 'hcl']
df.to_csv('results/CELLECT-LDSC/results/prioritization_corrected.csv', index=True)