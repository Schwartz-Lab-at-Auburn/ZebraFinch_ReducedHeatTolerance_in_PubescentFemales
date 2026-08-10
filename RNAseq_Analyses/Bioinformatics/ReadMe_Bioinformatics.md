## Bioinformatic Processing of the Blood RNAseq data from Baseline Samples

### Repository Outline and Summary
## Raw Data
- The raw RNAseq data have been submitted to NCBI SRA database under BioProject XXX
- We used the Zebra Finch Genome Assembly and corresponding annotation from NCBI RefSeq: 

## Processing the data.
Data were processed on a high performance computer. First, if an individual has two or more R1 and R2 files, then all the R1 files from a single individual were concatenated (cat) in to a single file, and all the R2 files from an indiviudal were concatenated into a single file. 

The data were processed in steps using a driver script to parallized the processing of individuals. The driver script will initiate 20 parallel processes allow 20 individuals to be processed for the steps called by that driver, until all the individuals were processed for those steps. 
  
Run MultiQC on the fastqc folder to get summary across all the FASTQC outputs
**1.0_Driver_FASTQC.sh**  This driver will run FASTQC on each sample to assess the quality of the reads.
  - 1.1_FASTQC.sh This script is called by the driver above. It defines the parameters for FASTQC.

Run MultiQC on the FASTQC folder to get summary across all the FASTQC outputs

**2.0_Driver_RemovePCRdups_FastQC.sh**  This driver will run FASTQCDUPAWAY to remove reads that are PCR duplicates within each individual. Then it will run FASTQC again to assess the quality of the deduplicated reads. 
  - 2.1_DeDup_Fastqdupaway_BeforeTrim.sh  This script is called by the driver above. It defines the parameters for FASTQCDUPAWAY.
  - 2.2_FASTQC-POSTdup.sh  This script is called by the driver above. It defines the parameters for FASTQC.
    Run MultiQC on the fastqc folder to get summary across all the FASTQC outputs
    
  - Trim (Trimmomatic)
  - Run Fastqc on cleaned data . Run MultiQC on the fastqc folder to get summary across all the FASTQC outputs
  - Map to NCBI reference genome (HiSat2)
  - Process Sam to Bam; Sort Bam, Index, Stats (Samtools)
  - Count the mapped reads to gene (Stringtie)
  - Run prepDE.py on the Stringtie folder to combine the genecounts into a single file to use for statistical analyes.
