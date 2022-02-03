#! /bin/bash

. doit-preamble.bash

# ------------------------------------------------------------------------
# Step 4. Run ReferenceSeeker
# ------------------------------------------------------------------------

if [ "$REFSEEK" ] ; then
    echo '# Running ReferenceSeeker...'
    REFSEEK="$REFSEEK" \
	   ./scripts/run-referenceseeker ${UNICYCLER}/assembly.fasta
fi
    
# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'

