
FROM continuumio/anaconda2

RUN /opt/conda/bin/conda config --add channels defaults && \
    /opt/conda/bin/conda config --add channels bioconda && \
    /opt/conda/bin/conda config --add channels conda-forge

# Install bowtie et al from bioconda
RUN /opt/conda/bin/conda install -c bioconda rsem hisat2 rmats sra-tools samtools cutadapt 

# Install pysradb
RUN pip install -U pandas tqdm && \
    cd /opt && \
    git clone https://github.com/saketkc/pysradb.git && \
    cd pysradb && \
    pip install -e .

# Install SRA-tools
#RUN cd /opt && \
#    curl -L http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.6-1/sratoolkit.2.9.6-1-ubuntu64.tar.gz | tar zx && \
#    echo "export PATH=/opt/sratoolkit.2.9.6-1-ubuntu64/bin:$PATH" >> ~/.bashrc

# Install RSEM
#RUN apt-get update && \
#    apt-get -y install make g++ && \
#    cd /opt && \
#    git clone https://github.com/deweylab/RSEM.git && \
#    cd RSEM && \
#    LDFLAGS="-L/opt/conda/lib" CFLAGS="-I/opt/conda/include -L/opt/conda/lib" make LDFLAGS="-L/opt/conda/lib" install

