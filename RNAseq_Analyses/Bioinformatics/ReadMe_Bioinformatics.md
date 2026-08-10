## Bioinformatic Processing of the Blood RNAseq data from Baseline Samples

### Repository Outline and Summary
## Raw Data
- The raw RNAseq data have been submitted to NCBI SRA database under BioProject XXX
- We used the Zebra Finch Genome Assembly and corresponding annotation from NCBI RefSeq: 

## Processing the data.
Data were processed on a high performance computer. First, if an individual has two or more R1 and R2 files, then all the R1 files from a single individual were concatenated (cat) in to a single file, and all the R2 files from an indiviudal were concatenated into a single file. 

The data were processed in steps using a driver script to parallized the processing of individuals. The driver script will initiate 20 parallel processes allow 20 individuals to be processed for the steps called by that driver, until all the individuals were processed for those steps. 
  

**1.0_Driver_FASTQC.sh**  This driver will run the FASTQC script on each sample to assess the quality of the reads.
  - **1.1_FASTQC.sh** This script is called by the driver above. It defines the parameters for FASTQC.

  On the command line, run MultiQC on the FASTQC folder to get summary across all the FASTQC outputs

**2.0_Driver_RemovePCRdups_FastQC.sh**  This driver will run the FASTQCDUPAWAY script to remove reads that are PCR duplicates within each individual. Then it will run FASTQC script again to assess the quality of the deduplicated reads. 
  - **2.1_DeDup_Fastqdupaway_BeforeTrim.sh**  This script is called by the driver above. It defines the parameters for FASTQCDUPAWAY.
  - **2.2_FASTQC-POSTdup.sh**  This script is called by the driver above. It defines the parameters for FASTQC.

    On the command line, run MultiQC on the FASTQC folder to get summary across all the FASTQC outputs

**3.0_Driver_Trim-Deduped_FastQC.sh**  This driver will run the TRIMMOMATIC script to trim the reads for quality within each individual. Then it will run FASTQC script again to assess the quality of the cleaned reads. 
  - **3.1_TRIMMO.sh** This script is called by the driver above. It defines the parameters for TRIMMOMATIC. It first removes adapters and then trims the reads for quality. It will keep reads at least 36 bp long, and only reads that are still paired.
  - **3.2_FASTQC-CL_Dedup_paired.sh**  This script is called by the driver above. It defines the parameters for FASTQC.

    On the command line, run MultiQC on the FASTQC folder to get summary across all the FASTQC outputs
    
 **4.0_Driver_HiSat_Stringtie_Baseline.sh** This driver will run the the HISAT2 script to map the data to the reference genome, then run BAM processing script to process the resulting SAM file, then run the STRINGTIE script to count the reads to the genes
  - **4.1_MAP_HISAT2.sh**  This script is called by the driver above. It defines the parameters for HISAT2 to map the reads.
  - **4.2_BAM_PROCESSING.sh** This script is called by the driver above. This script uses SAMTOOLS to process Sam to Bam; Sort the Bam, Index the Bam and calculating the mapping Statistics.
  - **4.3_COUNT-StringTie.sh**  This script is called by the driver above. It defines the parameters for STRINGTIE to count the reads to the genes.

**prepDE.py** On the command line, run the prepDE.py script on the Stringtie folder to combine the genecounts into a single .csv file (matrix of individuals by gene) to use for statistical analyses.
