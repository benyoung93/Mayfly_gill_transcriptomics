#!/bin/bash
#BSUB -J Trimming
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -e /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/trimming.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/trimming.o%J

# making a list of sample names
cd /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/rr/mf_raw_reads
MAYFLY=`ls *_R1.fastq.gz | cut -f-3 -d '_'`

echo "files being trimmed (reverse and forward reads)"
echo $MAYFLY

# trimming the files
for MAFL in $MAYFLY
do
echo "$MAFL"
echo '#!/bin/bash' > /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
echo '#BSUB -q bigmem' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
echo '#BSUB -J '"$MAFL"'_trim' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
echo '#BSUB -o /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/trim/'"$MAFL"'_o_trim.txt' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
echo '#BSUB -e /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/trim/'"$MAFL"'_e_trim.txt' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
echo '#BSUB -n 5' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
echo '#BSUB -R "rusage[mem=3000]"' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh

echo 'echo "This is the palmata sample being trimmed - '"${MAFL}"'"' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
echo '~/programs/TrimGalore-0.6.0/trim_galore \
--path_to_cutadapt ~/.local/bin/cutadapt \
--paired \
--retain_unpaired \
--phred33 \
--output_dir /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/trimmed \
--length 30 \
-q 5 \
--stringency 1 \
-e 0.1 \
/scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/rr/mf_raw_reads/'"${MAFL}"'_R1.fastq.gz \
/scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/rr/mf_raw_reads/'"${MAFL}"'_R2.fastq.gz' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
bsub < /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/trim/"$MAFL"_trimming.sh
done
