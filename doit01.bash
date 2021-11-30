#! /bin/bash

. doit-preamble.bash

# ------------------------------------------------------------------------
# Step 1. Run filtlong
# ------------------------------------------------------------------------

rm -rf ${FILTLONG}

if [ -e ${INPUTS}/raw_nanopore.fastq.gz ] ; then

    mkdir -p ${FILTLONG}
    echo 1>&2 '# Running filtlong...'
    ${HOWTO} filtlong --min_length 1000 --keep_percent 95 \
	     ${INPUTS}/raw_nanopore.fastq.gz \
	| gzip > ${FILTLONG}/filtered_nanopore.fastq.gz

else
    echo 1>&2 '# No long reads. Skipping filtlong...'
fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'
