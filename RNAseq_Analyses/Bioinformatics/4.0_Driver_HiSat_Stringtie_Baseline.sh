#!/bin/bash

#SBATCH --job-name=ZF.2_B_BL_Driver4              #-- For convenience, give your job a name
#SBATCH --time 10-00:00:00                         #-- The format is DD-HH:MM:SS.  #estimated wall time in which to run your job
#SBATCH --mail-user tss0019@auburn.edu          #-- Indicate if/when you want to receive email about your job
#SBATCH --mail-type=ALL                         #-- will send email for begin,end,fail
#SBATCH --output=ZF_B_Map%A-%a.out   #-- Changes the output to correspond to each subjob
#SBATCH --error=ZF_B_Map%A-%a.err    #-- Changes the error to correspond to each subjob
#SBATCH --nodes=1
#SBATCH --ntasks=20
#SBATCH --partition=general
#SBATCH --array=0-20					# This should match the number of files. Remember 0 counts as a node. So 0-98 will run 99 jobs

samples=(
ZF_4531_B_BL
ZF_4548_B_BL
ZF_4619_B_BL
ZF_4719_B_BL
ZF_4720_B_BL
ZF_4737_B_BL
ZF_4738_B_BL
ZF_4739_B_BL
ZF_4745_B_BL
ZF_4761_B_BL
ZF_4768_B_BL
ZF_4774_B_BL
ZF_4775_B_BL
ZF_4785_B_BL
ZF_4798_B_BL
ZF_4802_B_BL
ZF_4810_B_BL
ZF_4817_B_BL
ZF_4533_B_BL
ZF_4625_B_BL
ZF_4784_B_BL
)

sample_id=${samples[$SLURM_ARRAY_TASK_ID]}

# __________________________ 
##-- Define PATH for where scripts are located
HOMEDIR=/scratch/tss0019/ZebraFinch_AllBloodRNAseq

# __________________________
#--Load modules needed for job

#module load fastqc/0.12.0
#module load python/anaconda/3.11.7   # Needed for Mutliqc
#module load trimmomatic/0.39
module load gcc/4.8.5 			     # Needed for Samtools 1.20
module load samtools/1.20
module load hisat2/2.2.1
module load stringtie/2.1.6

###  Set the stack size to unlimited
ulimit -s unlimited
###  Turn echo on so all commands are echoed in the output log
set -x

# __________________________
#-- Runs Scripts

### Make sure we're in the same directory as the scripts
cd /home/tss0019/ZebraFinch_AllBlood
 
############# Run Mapping
./4.1_MAP_HISAT2_Stringtie.2.sh "$sample_id"

############# Run BAM Processing
./4.2_BAM_PROCESSING.2.sh "$sample_id"

############# Run Stringtime to count the reads mapped to each gene
./4.3_COUNT-StringTie.2.sh "$sample_id"

# __________________________

## Submit this command to run the driver!
#  sbatch 4_Driver_HiSat_Stringtie.sh
