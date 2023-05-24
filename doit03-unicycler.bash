#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Run Unicycler
# ------------------------------------------------------------------------

echo 1>&2 '# Running Unicycler...'

rm -rf ${UNICYCLER}
mkdir -p ${UNICYCLER}

UNICYCLER_ARGS=
if [ -e ${FASTP}/trimmed_R1.fastq.gz ] ; then
    UNICYCLER_ARGS+=" -1 ${FASTP}/trimmed_R1.fastq.gz"
    UNICYCLER_ARGS+=" -2 ${FASTP}/trimmed_R2.fastq.gz"
fi
if [ -e ${FILTLONG}/filtered_nanopore.fastq.gz ] ; then
    UNICYCLER_ARGS+=" -l ${FILTLONG}/filtered_nanopore.fastq.gz"
fi

unicycler -t $THREADS --mode $MODE \
	 ${UNICYCLER_ARGS} \
	 -o ${UNICYCLER}

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'
