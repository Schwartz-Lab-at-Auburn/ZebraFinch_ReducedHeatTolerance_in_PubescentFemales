HOMEDIR="/scratch/tss0019/ZebraFinch_AllBloodRNAseq"
DATADIR="/hosted/biosc/SchwartzLab/RNAseqData/ZebraFinch/AHDB/EXP1/All_Blood_mRNA_namesConsistent"
DeDupDATADIR="${HOMEDIR}/Data_Deduped"

###  use the sample IDs in the driver script
sample=$1

### Make the output directory
mkdir -p "$DeDupDATADIR"

### Move to the directory where the data files are.
cd "$DATADIR"

################## Run FASTA-Dupaway to remove PCR duplicates from the raw data.
### compar-seq Loose means will complare sequences of differnet sizes - important since these data have been trimmed.
### compar-seq tight means must start and stop at same place - same length. Use with untrimmed raw data.

fastq-dupaway -i "${sample}_1.fq.gz" -u "${sample}_2.fq.gz" 	\
	-o "$DeDupDATADIR"/"${sample}_1_dedup.fq.gz" -p "$DeDupDATADIR"/"${sample}_2_dedup.fq.gz" \
        --format fastq \
        --compare-seq tight 


