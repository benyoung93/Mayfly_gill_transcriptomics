#!/bin/bash
#BSUB -J renaming_files
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -e /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/rename.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/rename.o%J

cd /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/rr/mf_raw_reads

## Read 1
mv 24HFW1_R1.fastq.gz fw_d1_w1_R1.fastq.gz
mv 24HFW2_R1.fastq.gz fw_d1_w2_R1.fastq.gz
mv 24HFW3_R1.fastq.gz fw_d1_w3_R1.fastq.gz
mv 24HSCW1_R1.fastq.gz nacl_d1_w1_R1.fastq.gz
mv 24HSCW2_R1.fastq.gz nacl_d1_w2_R1.fastq.gz
mv 24HSCW3_R1.fastq.gz nacl_d1_w3_R1.fastq.gz
mv 1WFW1_R1.fastq.gz fw_d7_w1_R1.fastq.gz
mv 1WFW2_R1.fastq.gz fw_d7_w2_R1.fastq.gz
mv 1WFW3_R1.fastq.gz fw_d7_w3_R1.fastq.gz
mv 1WSCW1_R1.fastq.gz nacl_d7_w1_R1.fastq.gz
mv 1WSCW2_R1.fastq.gz nacl_d7_w2_R1.fastq.gz
mv 1WSCW3_R1.fastq.gz nacl_d7_w3_R1.fastq.gz

## Read 2
mv 24HFW1_R2.fastq.gz fw_d1_w1_R2.fastq.gz
mv 24HFW2_R2.fastq.gz fw_d1_w2_R2.fastq.gz
mv 24HFW3_R2.fastq.gz fw_d1_w3_R2.fastq.gz
mv 24HSCW1_R2.fastq.gz nacl_d1_w1_R2.fastq.gz
mv 24HSCW2_R2.fastq.gz nacl_d1_w2_R2.fastq.gz
mv 24HSCW3_R2.fastq.gz nacl_d1_w3_R2.fastq.gz
mv 1WFW1_R2.fastq.gz fw_d7_w1_R2.fastq.gz
mv 1WFW2_R2.fastq.gz fw_d7_w2_R2.fastq.gz
mv 1WFW3_R2.fastq.gz fw_d7_w3_R2.fastq.gz
mv 1WSCW1_R2.fastq.gz nacl_d7_w1_R2.fastq.gz
mv 1WSCW2_R2.fastq.gz nacl_d7_w2_R2.fastq.gz
mv 1WSCW3_R2.fastq.gz nacl_d7_w3_R2.fastq.gz
