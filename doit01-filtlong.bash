#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Run filtlong
# ------------------------------------------------------------------------

rm -rf ${FILTLONG}

if [ -z "${NANOPORE_FQ_GZ}" ] ; then

    echo 1>&2 '# No long reads. Skipping filtlong...'

else
    mkdir -p ${FILTLONG}
    echo 1>&2 '# Running filtlong...'
    filtlong --min_length 1000 --keep_percent 95 \
	     ${INPUTS}/raw_nanopore.fastq.gz \
	| gzip > ${FILTLONG}/filtered_nanopore.fastq.gz

fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'
