#!/bin/bash
#BSUB -J trinity_qc_1
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -e /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/trinity_qc_1.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/trinity_qc_1.o%J


/nethome/bdy8/programs/trinityrnaseq-v2.13.2/util/TrinityStats.pi TRINITYFATSA > trinity_run_stats.txt
