ARG CUDA_VERSION="11.6.2"
ARG CUDNN_VERSION="8"
ARG UBUNTU="ubuntu20.04"

# ref. https://zenn.dev/opamp/articles/7880812d78226f
FROM nvidia/cuda:${CUDA_VERSION}-cudnn${CUDNN_VERSION}-devel-${UBUNTU}

ARG CONDA_ENV="myenv"

####
# Libraries
####

RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim \
    git

####
# Conda Environment
####

# ref. https://qiita.com/kubokoHappy/items/6388c186e16028d3e699

WORKDIR /opt

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 && \
    rm -r Miniconda3-latest-Linux-x86_64.sh

ENV PATH /opt/miniconda3/bin:$PATH

COPY environment.yml /tmp/conda-tmp/

RUN pip install --upgrade pip && \
    conda update -n base -c defaults conda && \
    conda env create -n $CONDA_ENV -f /tmp/conda-tmp/environment.yml && \
    rm -rf /tmp/conda-tmp/

ENV CONDA_DEFAULT_ENV $CONDA_ENV && \
    PATH /opt/conda/envs/$CONDA_ENV/bin:$PATH

RUN conda init && \
    echo "conda activate $CONDA_ENV" >> ~/.bashrc
