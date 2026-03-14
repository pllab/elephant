FROM mirror.gcr.io/library/debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    bash \
    build-essential \
    cmake \
    curl \
    git \
    less \
    nano \
    python3-full \
    python3-pip \
    python3-pybind11 \
    time \
    yosys \
    && rm -rf /var/lib/apt/lists/*

# Install PyRTL
RUN pip3 install --break-system-packages pyrtl

WORKDIR /opt
COPY . /opt

# Install OpenRAM
RUN git clone https://github.com/VLSIDA/OpenRAM.git && cd OpenRAM
ENV OPENRAM_HOME=/opt/OpenRAM/compiler
ENV OPENRAM_TECH=/opt/OpenRAM/technology
ENV PYTHONPATH=/opt/OpenRAM/compiler
RUN echo 'lef_rom_interconnect = ["metal1", "metal2", "metal3"]' >> \
    /opt/OpenRAM/technology/scn4m_subm/tech/tech.py
RUN pip3 install --break-system-packages -e /opt/OpenRAM

# Build baseline decompiler emap dataflow analysis
RUN cd decompiler/baseline && \
	./build_emapcc.sh
