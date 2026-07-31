FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 1. Instalar únicamente las dependencias de compilación y librerías del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libx11-dev \
    libxmu-dev \
    libxi-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libexpat1-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Descargar y compilar Geant4 desde el sitio del CERN
WORKDIR /opt
RUN wget https://geant4-data.web.cern.ch/releases/geant4-v11.1.2.tar.gz && \
    tar -xzf geant4-v11.1.2.tar.gz && \
    rm geant4-v11.1.2.tar.gz && \
    mkdir geant4-build && \
    cd geant4-build && \
    cmake -DGEANT4_INSTALL_DATA=ON -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_QT=ON ../geant4-v11.1.2 && \
    make -j4 && \
    make install && \
    cd /opt && rm -rf geant4-build geant4-v11.1.2

RUN mkdir -p /geant4lab

COPY geant4make.sh /usr/local/bin/geant4make.sh
RUN chmod +x /usr/local/bin/geant4make.sh

COPY geant4lab /geant4lab

WORKDIR /geant4lab

CMD ["/bin/bash"]
