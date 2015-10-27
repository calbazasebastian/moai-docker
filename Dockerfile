FROM ubuntu:14.04.2
MAINTAINER sebi
RUN sudo apt-get update 
RUN apt-get install -y libxcb-render0-dev libxcb-xtest0-dev libxcb-icccm4-dev libxcb-ewmh-dev \
    libiconv-hook-dev libxcb-util0-dev  libxext-dev  libsdl2-dev freeglut3-dev libglew-dev \
    libglu1-mesa-dev libxmu-dev libxi-dev  build-essential ruby libesd0-dev cmake autoconf \
    libxcb-render0-dev libxcb-xtest0-dev libxcb-icccm4-dev libxcb-ewmh-dev  libiconv-hook-dev  \
    libxcb-render-util0-dev libxcb-image0 libxcb-image0-dev libxcb-composite0-dev libxcb-damage0-dev \
    libxcb-shm0-dev libxcb-xv0-dev   libbsd-dev libaudio-dev libxcb-render-util0-dev libxcb-image0-dev \
    libpng-dev
ADD moai-dev moai-dev
RUN cd moai-dev && ./bin/build-linux.sh