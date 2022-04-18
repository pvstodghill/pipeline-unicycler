#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Compute stats
# ------------------------------------------------------------------------

rm -rf ${STATS}
mkdir -p ${STATS}

if [ -z "$R1_FQ_GZ" ] ; then

    echo 1>&2 '# fixme: Compute stats for long reads only'

elif [ -z "$NANOPORE_FQ_GZ" ] ; then

    echo 1>&2 '# Compute stats for short-reads'

    ${PIPELINE}/scripts/compute-assembly-stats \
	-t ${THREADS} \
	-q -s -S ${STRAIN}${VERSION} \
	${INPUTS}/raw_short_R1.fastq.gz \
	${INPUTS}/raw_short_R2.fastq.gz \
	${FASTP}/trimmed_R1.fastq.gz \
	${FASTP}/trimmed_R2.fastq.gz \
	${DATA}/final.fna \
	${DATA}/final.gff \
    | tee ${STATS}/stats.tsv

else
    
    echo 1>&2 '# Compute stats for long- and short-reads'

    ${PIPELINE}/scripts/compute-assembly-stats \
	-t ${THREADS} \
	-q -s -S ${STRAIN}${VERSION} \
	${INPUTS}/raw_nanopore.fastq.gz \
	${FILTLONG}/filtered_nanopore.fastq.gz \
	${INPUTS}/raw_short_R1.fastq.gz \
	${INPUTS}/raw_short_R2.fastq.gz \
	${FASTP}/trimmed_R1.fastq.gz \
	${FASTP}/trimmed_R2.fastq.gz \
	${DATA}/final.fna \
	${DATA}/final.gff \
    | tee ${STATS}/stats.tsv

fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'

