## Statistical analysis of the Baseline Blood RNAseq data. 
These analyses use only the pubescent females: those that succumbed relative to those that survived.

## Differential Gene Expression
- This R Notebook walks through the Differential Gene Expression Analysis: Submit_DGEseq_HeatDeath_deDup_OnlyPubescent.Rmd
- Input files
  - The raw gene counts from the Bioinformatics: Submit_DGESeq_results_Dataset2-DeDup_Females_OnlyPubescent.csv
  - The groups: PHENO_DATA_Baseline_DeDupHeatDeath_OnlyPubescent_n17.txt
  - Results are in the Supplemental File and here: Submit_DGESeq_results_Dataset2-DeDup_Females_OnlyPubescent.csv
      - positive log2fold values indicate upregulated in the females that would succumb relative to those that would survive the acute heat treatment.
      -  negative log2fold values indicate upregulated in the females that would succumb relative to those that would survive the acute heat treatment.

## Gene Set Enrichment Analysis
- The results of the differential gene expression analysis were used to create a ranked list of the genes based on their change in expression and statistical significance. DeDup_DGErankName_OnlyPubescent.rnk
- This file was used on the GSEA GUI application to test for enrichment of biological states and processes and molecular pathways associated with the pubescent females that would succumb to the acute heat treatment, relative to those that survived. We used the pre-ranked list option and the Molecular Signatures Database (Hallmarks).
- Results are here.
  - Upregulated in the females that would succumb: gsea_report_for_na_neg_1786041146949.tsv
  - Downregulated int he females that would succumb: gsea_report_for_na_pos_1786041146949.tsv
