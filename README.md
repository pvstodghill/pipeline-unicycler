# pipeline-unicycler

Pipeline for assembling prokaryotic genomes using
[Unicycler](https://github.com/rrwick/Unicycler).

## Cloning the repo

This pipeline using Git submodules. The easiest way to clone this repo (with a recent version of `git`) is

```
git clone --recurse-submodules https://github.com/pvstodghill/pipeline-rnaseq.git
```

## Installing prereqs (not Conda)

One of the following:

- [Docker](https://www.docker.com/)
- [Singularity](https://sylabs.io/)
- [Apptainer](https://apptainer.org/)

You will also need,

- Perl's YAML module.

## Installing prereqs using [Conda](https://conda.io)

```
# conda env remove -y --name pipeline-unicycler
conda create -y --name pipeline-unicycler
conda activate pipeline-unicycler

conda config --add channels bioconda
conda config --add channels conda-forge

# required
conda install -y "samtools>=1.10"
conda install -y emboss
conda install -y entrez-direct
conda install -y fastp=0.22.0 # <-- for me 0.23.x hangs
conda install -y filtlong
conda install -y prokka
conda install -y unicycler

# encouraged
conda install -y referenceseeker

```

## Configuring the pipeline


To run the pipeline on your own data,

1. Copy `config.template.bash` to `config.bash`.
2. Edit `config.bash` according to your needs and local environment.

Note: The `GENUS` and `SPECIES` variables are not used until the
genome annotation step. If you do not know the `GENUS` and `SPECIES`,
leave these variables unset, run the pipeline through the
ReferenceSeeker step (\#5), consult the ReferenceSeeker output and
whatever other information you have to assign a genus and species for
your strain, edit `config.bash` and assign the correct names for
`GENUS` and `SPECIES`, and finally run the rest of the pipeline.

## Running the pipeline

1. `./doit00.bash`
2. `./doit01.bash`
3. ...


