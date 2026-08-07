#!/bin/bash

HOMEDIR="/scratch/tss0019/ZebraFinch_AllBloodRNAseq"
CLDeDupDATADIR="${HOMEDIR}/Dedup_Clean_Paired"
CLDeDupQCDATA="${HOMEDIR}/QC/FastQC_Clean_DeDup"

###  use the sample IDs in the driver script
sample=$1

### Make the output directory
mkdir -p "$CLDeDupQCDATA"

### Move to the directory where the data files are.
cd "$CLDeDupDATADIR"

################## Run FASTQC to assess the quality of the data
fastqc -t 20 "${CLDeDupDATADIR}"/"${sample}_1_paired.fq.gz"   "${CLDeDupDATADIR}"/"${sample}_2_paired.fq.gz" --outdir="$CLDedupQCDATA"

