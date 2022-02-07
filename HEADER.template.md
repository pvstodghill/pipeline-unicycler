---
title: Assembly of FIXME
author: Paul Stodghill
date: FIXME
projects: FIXME
tags: 
...

# Summary

FIXME

# Results

Assemble statistics:

FIXME: put doit07.out stats here.

ReferenceSeeker results:

~~~
FIXME: put ReferenceSeeker results (doit04.out) here.
~~~

PGAP "taxcheck" results:

~~~
FIXME: PGAP ANI results (${DATA}/06_pgap/ani-tax-report.txt) here.
~~~

# Method

This is abbreviated. It needs to be flushed out.

Step 0. The input files were collected and stored within this directory
tree.

Step 1. (FIXME: was this step run?) FiltLong was used to trim and filter the
Nanopore reads.

Step 2. (FIXME: was this step run?) FASTP was used to trim and filter
the Illumina reads.

Step 3. An assembly was generated using Unicycler with the `--mode
FIXME:normal` parameter.

Step 4. (FIXME: was this step run?) ReferenceSeeker was used to
determine the most similar reference sequences.

Step 5. The sequences of the Trycycler assemble were "normalized":
(a) instances of the phi-X phage genome were removed; (b) the contigs
were renamed, "chromosome", "plasmidA", "plasmidB", etc., based on
sequence length; (c) sequences were rotated to put, e.g., DnaA near
position 1 on the positive strand; FIXME (d) contigs too small for
PGAP were removed.

Step 6. FIXME: PGAP was used to annotate the final sequence.

Step 6. FIXME: Prokka was used to annotate the final sequence.

If used at all, the following software versions were used:

- [Entrez-direct](ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/) 15.7.20210909
- [Emboss](http://emboss.sourceforge.net) 6.6.0
- [Fastp](https://github.com/OpenGene/fastp) 0.22.0
- [Filtlong](https://github.com/rrwick/Filtlong) 0.2.1
- [PGAP](https://github.com/ncbi/pgap) FIXME
- [Prokka](https://github.com/tseemann/prokka) 1.14.6
- [Referenceseeker](https://github.com/oschwengers/referenceseeker) 1.7.3

    + RefSeq DB release FIXME
    + GTDB DB release FIXME

- [Samtools](https://github.com/samtools/samtools) 1.14
- [Unicycler](https://github.com/rrwick/Unicycler) 0.4.9

------------------------------------------------------------------------

