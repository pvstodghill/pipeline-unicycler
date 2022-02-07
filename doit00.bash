#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Set up
# ------------------------------------------------------------------------

# if [ -d ${DATA} ] ; then
#     echo 1>&2 "${DATA}/ already exists. cannot continue."
#     exit 1
# fi

echo 1>&2 "# Initializing ${DATA}/..."
mkdir -p ${DATA}/tmp
mkdir -p ${INPUTS}

echo 1>&2 '# Making copies of raw reads...'

if [ "${NANOPORE_FQ_GZ}" ] ; then
    OK=1
    cp ${NANOPORE_FQ_GZ} ${INPUTS}/raw_nanopore.fastq.gz
fi
if [ "${R1_FQ_GZ}" ] ; then
    OK=1
    cp ${R1_FQ_GZ} ${INPUTS}/raw_short_R1.fastq.gz
    cp ${R2_FQ_GZ} ${INPUTS}/raw_short_R2.fastq.gz
fi

if [ -z "$OK" ] ; then
    echo 1>&2 "Error: either long or short reads are required. both can be provided."
    exit 1
fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'
