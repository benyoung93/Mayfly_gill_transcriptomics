#!/bin/bash
#BSUB -J trinity
#BSUB -q bigmem
#BSUB -P transcriptomics
#BSUB -n 20
#BSUB -e /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/trinity.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/trinity.o%J
#BSUB -W 5:00

cd /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/

trinity \
--seqType fq \
--samples_file /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/metadata/mf_trin_md.txt \
--CPU 20 \
--max_memory 50G \
--verbose \
--output /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/trinity_assembley
