#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# https://github.com/Nextomics/NextPolish
# ------------------------------------------------------------------------

rm -rf ${POLISHED}
mkdir ${POLISHED}


if [ -z "${R1_FQ_GZ}" ] ; then

    echo 1>&2 '# No Illumina reads to for polishing'

    cp ${UNICYCLER}/assembly.fasta ${POLISHED}/polished.fasta

else

    echo 1>&2 '# Polishing with short-reads (Nextpolish)'

    cp ${UNICYCLER}/assembly.fasta ${POLISHED}/unpolished.fasta
    cp ${FASTP}/trimmed_R1.fastq.gz ${POLISHED}/trimmed_R1.fastq.gz
    if [ "${R2_FQ_GZ}" ] ; then
	cp ${FASTP}/trimmed_R2.fastq.gz ${POLISHED}/trimmed_R2.fastq.gz
    fi
    (
	cd ${POLISHED}

	cat <<EOF > sgs.fofn
trimmed_R1.fastq.gz
EOF
    if [ "${R2_FQ_GZ}" ] ; then
	cat <<EOF >> sgs.fofn
trimmed_R2.fastq.gz
EOF
    fi

	cat <<EOF  > run.cfg
task = best
genome = unpolished.fasta
sgs_fofn = sgs.fofn
workdir = tmp
EOF

    if [ -z "${R2_FQ_GZ}" ] ; then
	cat <<EOF  >> run.cfg
sgs_options = -unpaired
EOF
    fi

	nextPolish run.cfg

	cat tmp/03.kmer_count/*polish.ref.sh.work/polish_genome*/genome.nextpolish.part*.fasta \
	    > polished.fasta

    )

fi

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 ''
echo 1>&2 '# Done.'

