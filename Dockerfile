
FROM continuumio/anaconda2

RUN /opt/conda/bin/conda config --add channels defaults && \
    /opt/conda/bin/conda config --add channels bioconda && \
    /opt/conda/bin/conda config --add channels conda-forge

# Install bowtie et al from bioconda
RUN /opt/conda/bin/conda install -c bioconda rsem hisat2 rmats sra-tools samtools cutadapt bowtie2
