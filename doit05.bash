#! /bin/bash

. doit-preamble.bash

# ------------------------------------------------------------------------
# Run ReferenceSeeker
# ------------------------------------------------------------------------

if [ "$REFSEEK" ] ; then
    echo '# Running ReferenceSeeker...'
    REFSEEK="$REFSEEK" \
	   ./scripts/run-referenceseeker ${POLISHED}/polished.fasta
fi
    
# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'

