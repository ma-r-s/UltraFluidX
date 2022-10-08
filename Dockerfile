FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
  && apt-get install build-essential

COPY hwCFDSolvers2022.1_linux64.bin solver.bin

RUN apt-get install -y --no-install-recommends openmpi-bin openmpi-common

RUN ./solver.bin -i silent -DACCEPT_EULA='YES'

RUN source /root/2022.1/altair/hwcfdsolvers/ultrafluidx/linux64/scripts/set_uFX_environment.sh

RUN echo "source /root/2022.1/altair/hwcfdsolvers/ultrafluidx/linux64/scripts/set_uFX_environment.sh" >> ~/.bashrc

RUN ultraFluidX -h