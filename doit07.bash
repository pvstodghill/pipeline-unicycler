#! /bin/bash

. doit-preamble.bash

if [ -z "${GENUS}" -o "${GENUS}" = FIXME ] ; then
    echo 1>&2 config.bash: GENUS is not set.
    exit 1
fi

if [ -z "${SPECIES}" -o "${SPECIES}" = FIXME ] ; then
    echo 1>&2 config.bash: SPECIES is not set.
    exit 1
fi

# ------------------------------------------------------------------------
# Running PGAP or Prokka
# ------------------------------------------------------------------------

if [ "$PGAP_HOME" ] ; then

    . config07.bash

    echo 1>&2 '# Running PGAP...'

    rm -rf ${PGAP_OUT}

    TAXON_ID=$(esearch -db taxonomy -query "$GENUS $SPECIES" | efetch -format uid)
    if [ -z "$TAXON_ID" ] ; then
	echo 1>&2 ''
	echo 1>&2 '*** TAXON_ID is empty! ***'
	exit 1
    fi

    ./scripts/run-pgap \
	-u -f \
	-S $STRAIN -V "${VERSION}" \
	-t ${TAXON_ID} \
	-o ${PGAP_OUT} \
	-p ${PGAP_HOME} \
	${NORMALIZED}/sanitized.fasta  -- ${PGAP_ARGS}

    echo 1>&2 '# Finishing up...'

    cp ${PGAP_OUT}/annot.faa data/final.faa
    cp ${PGAP_OUT}/annot.fna data/final.fna
    cp ${PGAP_OUT}/annot.gbk data/final.gbk

else
    
    echo 1>&2 '# Running Prokka...'

    rm -rf ${PROKKA}

    prokka --cpus 0 --quiet \
	     --outdir ${PROKKA} \
	     --prefix output \
	     --gram ${GRAM} \
	     --genus ${GENUS} \
	     --species ${SPECIES} \
	     --strain ${STRAIN} \
	     --locustag ${STRAIN}${VERSION}_prokka \
	     --rfam --addgenes \
	     ${NORMALIZED}/normalized.fasta

    echo 1>&2 '# Finishing up...'

    cp ${PROKKA}/output.faa data/final.faa
    cp ${PROKKA}/output.fna data/final.fna
    cp ${PROKKA}/output.gbk data/final.gbk

    cat ${PROKKA}/output.gff \
	| sed -e '/^##FASTA/,$d' \
	> data/final.gff
fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'
