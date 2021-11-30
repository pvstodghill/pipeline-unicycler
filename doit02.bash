#! /bin/bash

. doit-preamble.bash

# ------------------------------------------------------------------------
# Step 2. Run fastp - https://github.com/OpenGene/fastp
# ------------------------------------------------------------------------

rm -rf ${FASTP}

if [ -z "${R1_FQ_GZ}" ] ; then

    echo 1>&2 '# No Illumina reads to trim'

elif [ "${SKIP_FASTP}" ] ; then

    echo 1>&2 '# Skipping Illumina clean-up'
    mkdir ${FASTP}
    cp --archive ${INPUTS}/raw_short_R1.fastq.gz ${FASTP}/trimmed_R1.fastq.gz
    cp --archive ${INPUTS}/raw_short_R2.fastq.gz ${FASTP}/trimmed_R2.fastq.gz

else

    echo 1>&2 '# Clean-up Illumina reads'
    mkdir ${FASTP}
    fastp \
	--thread ${THREADS} \
	--adapter_fasta inputs/NEBnext_PE.fa \
	--json ${FASTP}/fastp.json \
	--html ${FASTP}/fastp.html \
	--in1 ${INPUTS}/raw_short_R1.fastq.gz \
	--in2 ${INPUTS}/raw_short_R2.fastq.gz  \
	--out1 ${FASTP}/trimmed_R1.fastq.gz \
	--out2 ${FASTP}/trimmed_R2.fastq.gz \
	--unpaired1 ${FASTP}/u.fastq.gz \
	--unpaired2 ${FASTP}/u.fastq.gz

fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'

