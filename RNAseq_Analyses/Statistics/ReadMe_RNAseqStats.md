## Statistical analysis of the Blood RNAseq data from Baseline Samples

## Differential Gene Expression
- This R Notebook walks through the Differential Gene Expression Analysis: Submit_DGEseq_HeatDeath_deDup_OnlyPubescent.Rmd
- Input files
  - The raw gene counts from the Bioinformatics: Submit_DGESeq_results_Dataset2-DeDup_Females_OnlyPubescent.csv
  - The groups: PHENO_DATA_Baseline_DeDupHeatDeath_OnlyPubescent_n17.txt 

## Processing the data.
Data were processed on a high performance computer. First, if an individual has two or more R1 and R2 files, then all the R1 files from a single individual were concatenated (cat) in to a single file, and all the R2 files from an indiviudal were concatenated into a single file. 

The data were processed in steps using a driver script to parallized the processing of individuals. The driver script will initiate 20 parallel processes allow 20 individuals to be processed for the steps called by that driver, until all the individuals were processed for those steps. 
  

