FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar herramientas de compilacion, CMake, Git y dependencias de OpenGL/Qt para interfaz grafica
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
    && rm -rf /var/lib/apt/lists/*

# Crear la carpeta exigida por el proyecto
RUN mkdir -p /geant4lab

# Copiar el script geant4make.sh a /usr/local/bin para que sea ejecutable como comando desde cualquier lugar
COPY geant4make.sh /usr/local/bin/geant4make.sh
RUN chmod +x /usr/local/bin/geant4make.sh

# Copiar el contenido de la carpeta del proyecto dentro del contenedor
COPY geant4lab /geant4lab

WORKDIR /geant4lab

CMD ["/bin/bash"]
