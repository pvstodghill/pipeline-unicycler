# pipeline-unicycler

Pipeline for assembling prokaryotic genomes using
[Unicycler](https://github.com/rrwick/Unicycler).

Setting a [Conda](https://conda.io) environment for the pipeline,

```
# conda env remove -y --name pipeline-unicycler
conda create -y --name pipeline-unicycler
conda activate pipeline-unicycler

conda config --add channels bioconda
conda config --add channels conda-forge

# required
conda install -y fastp=0.22.0 # <-- for me 0.23.x hangs
conda install -y filtlong
conda install -y prokka
conda install -y unicycler

# encouraged
conda install -y referenceseeker

```

