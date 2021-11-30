#! /bin/bash

. doit-preamble.bash

# ------------------------------------------------------------------------
# Compute stats
# ------------------------------------------------------------------------

if [ -z "$R1_FQ_GZ" ] ; then

    echo 1>&2 '# fixme: Compute stats for long reads only'

elif [ -z "$NANOPORE_FQ_GZ" ] ; then


    ./scripts/compute-assembly-stats \
	-t ${THREADS} \
	-q -s -S ${STRAIN} \
	${INPUTS}/raw_short_R1.fastq.gz \
	${INPUTS}/raw_short_R2.fastq.gz \
	${FASTP}/trimmed_R1.fastq.gz \
	${FASTP}/trimmed_R2.fastq.gz \
	data/final.fna \
	data/final.gff

else
    
    ./scripts/compute-assembly-stats \
	-t ${THREADS} \
	-q -s -S ${STRAIN} \
	${INPUTS}/raw_nanopore.fastq.gz \
	${FILTLONG}/filtered_nanopore.fastq.gz \
	${INPUTS}/raw_short_R1.fastq.gz \
	${INPUTS}/raw_short_R2.fastq.gz \
	${FASTP}/trimmed_R1.fastq.gz \
	${FASTP}/trimmed_R2.fastq.gz \
	data/final.fna \
	data/final.gff

fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'

