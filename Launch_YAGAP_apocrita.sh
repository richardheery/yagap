#!/bin/sh
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --time=240:00:00
#SBATCH --output=%x-%j.o
#SBATCH --error=%x-%j.e
#SBATCH --job-name=yagap


#module load HGI/common/nextflow/24.10.4
module load nextflow

module load use.own miniforge
#conda activate portcullis-env
# conda activate mikado

#ml samtools

export NXF_OPTS="-Xms8G -Xmx16G"

genome=$1
sample_sheet=$2

nextflow run /data/home/btx717/storage/01-ademendoza/software/yagap -resume -with-trace -with-report --verbose --genome "$genome" --sr_rnaseq_reads "$sample_sheet"
