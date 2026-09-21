## Statistical analysis of the Blood RNAseq data from Baseline Samples

## Differential Gene Expression
- The raw RNAseq data have been submitted to NCBI SRA database under BioProject: PRJNA1474505
- We used the Zebra Finch Genome Assembly and corresponding annotation from NCBI RefSeq: bTaeGut7.mat accesssion GCF_048771995.1 
 

## Processing the data.
Data were processed on a high performance computer. First, if an individual has two or more R1 and R2 files, then all the R1 files from a single individual were concatenated (cat) in to a single file, and all the R2 files from an indiviudal were concatenated into a single file. 

The data were processed in steps using a driver script to parallized the processing of individuals. The driver script will initiate 20 parallel processes allow 20 individuals to be processed for the steps called by that driver, until all the individuals were processed for those steps. 
  

