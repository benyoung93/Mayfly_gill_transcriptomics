#!/bin/bash
#BSUB -J unzipping
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -e /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/unzip.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/unzip.o%J


cd /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/rr/
MAYFLY=`ls`

for MF in $MAYFLY
do
echo "$MF"
echo '#!/bin/bash' > /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/unzip/"$MF"_uz.sh
echo '#BSUB -q general' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/unzip/"$MF"_uz.sh
echo '#BSUB -J '"$MF"'_unzip' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/unzip/"$MF"_uz.sh
echo '#BSUB -o /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/unzip/'"$MF"'_o_uz.txt' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/unzip/"$MF"_uz.sh
echo '#BSUB -e /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/error_output/unzip/'"$MF"'_e_uz.txt' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/unzip/"$MF"_uz.sh

echo 'gunzip /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/rr/'"${MF}"'' >> /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/unzip/"$MF"_uz.sh

bsub < /scratch/projects/transcriptomics/ben_young/mayfly_denovo_t/scripts/unzip/"$MF"_uz.sh
done
