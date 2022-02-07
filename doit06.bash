#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# "Normalize" the genome.
# ------------------------------------------------------------------------

echo 1>&2 '# "Normalizing" the genome...'

rm -rf ${NORMALIZED}
mkdir -p ${NORMALIZED}

cat ${POLISHED}/polished.fasta \
    | ${PIPELINE}/scripts/rename-contigs -d ${STRAIN}${VERSION}_ \
    | ${PIPELINE}/scripts/dephix \
	  > ${NORMALIZED}/normalized.fasta

if [ "$PGAP_HOME" ] ; then

    echo 1>&2 '# "Sanitizing" the genome for PGAP...'


    cat ${NORMALIZED}/normalized.fasta \
	| ${PIPELINE}/scripts/sanitize-for-pgap \
	      > ${NORMALIZED}/sanitized.fasta

fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'

