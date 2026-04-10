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
conda activate mikado

#ml samtools

export NXF_OPTS="-Xms8G -Xmx16G"

genome=$1
sample_sheet=$2

nextflow run /data/home/qp24520/git_repos/yagap \
	-resume \
	-with-trace \
	-with-report yagap_report.html \
	-ansi-log false \
	--verbose \
	--genome "$genome" \
	--sr_rnaseq_reads "$sample_sheet"
	
# sbatch ~/git_repos/yagap/Launch_YAGAP_apocrita.sh /data/SBCS-ademendoza/Annotations/Salpingoeca_helianthica/Shel_hifiasm_3runs_qsub.bp.p_ctg.nobac.fasta ~/git_repos/yagap/sample_sheet.txt
