# directory into which the results are written.
#DATA=.
#DATA=data # default

STRAIN=FIXME
VERSION=

GENOME_SIZE=5000000

# One or both of ${NANOPORE_FQ_GZ} and ${Rx_FQ_GZ} is required

NANOPORE_FQ_GZ=../000NOTES/2020-*-FIXME-demux/output/barcodeFIXME.fastq.gz

ILLUMINA_DIR=../000NOTES/2020-09-10-more-illumina-brc-downloads/
R1_FQ_GZ=$ILLUMINA_DIR/*Pag_FIXME_*_R1.fastq.gz
R2_FQ_GZ=$ILLUMINA_DIR/*Pag_FIXME_*_R2.fastq.gz

FASTP_ADAPTER_ARGS= # Use auto-detection method
#FASTP_ADAPTER_ARGS=--adapter_fasta inputs/NEBnext_PE.fa
#SKIP_FASTP=true # Illumina reads are already trimmed

#MODE=conservative
MODE=normal
#MODE=bold

#REFSEEK=$HOME/scratch/referenceseeker

# ------------------------------------------------------------------------

if [ -e /programs/docker/bin/docker1 ] ; then
    export HOWTO_DOCKER_CMD=/programs/docker/bin/docker1
fi

# Uncomment to get packages from HOWTO
PACKAGES_FROM=howto

# uncomment to use conda
#PACKAGES_FROM=conda
#CONDA_EXE=$(type -p conda)
#CONDA_ENV=pipeline-unicycler

# Override the default number of threads (nproc --all)
#THREADS=32
