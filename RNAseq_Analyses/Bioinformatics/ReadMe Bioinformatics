## Bioinformatic Processing of the Blood RNAseq data from Baseline Samples

### Repository Outline and Summary
## Raw Data
- The raw RNAseq data have been submitted to NCBI SRA database under BioProject XXX
- We used the Zebra Finch Genome Assembly and corresponding annotation from NCBI RefSeq: 

## Processing the data.
Data were processed on a high performance computer. First, if an individual has two or more R1 and R2 files, then all the R1 files from a single individual were concatenated (cat) in to a single file, and all the R2 files from an indiviudal were concatenated into a single file. 
The data were processed in steps using a driver script to parallized the processing of individuals. The driver script would initiate 20 parallel processes allow 20 individuals to be processed for the steps called by that driver, until all the individuals were processed for those steps. 
  
Run MultiQC on the fastqc folder to get summary across all the FASTQC outputs
3. Run the pipelien - can use the 2_Driver script to do as an array job
  - Trim (Trimmomatic)
  - Run Fastqc on cleaned data
  - Map to NCBI reference genome (HiSat2)
  - Process Sam to Bam; Sort Bam, Index, Stats (Samtools)
  - Count the mapped reads to gene (Stringtie)
4.   Run MultiQC on the CLEANED fastqc folder to get summary across all the FASTQC outputs
     Run prepDE.py on the Stringtie folder to combine the genecounts into a single file to use for statistical analyes.

See more detailed notes on the analysis here:
 /Box/NSF_Damage-Fitness project-Research/Experiment_2024Fall_AcuteHeat_DamageBiomarkers_Exp1/Data/DataAnalyses/RNAseq 
