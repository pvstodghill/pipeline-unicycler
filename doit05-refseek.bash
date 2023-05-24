#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Run ReferenceSeeker
# ------------------------------------------------------------------------

if [ "$REFSEEK" ] ; then

    rm -rf ${REFERENCESEEKER}
    mkdir ${REFERENCESEEKER}

    echo '# Running ReferenceSeeker...'
    REFSEEK="$REFSEEK" \
	   ${PIPELINE}/scripts/run-referenceseeker ${POLISHED}/polished.fasta \
	   2>&1 | tee ${REFERENCESEEKER}/log.log
fi
    
# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'

