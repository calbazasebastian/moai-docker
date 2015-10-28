FROM ubuntu:14.04.2
MAINTAINER sebi
RUN sudo apt-get update 
# RUN apt-get install -y git libxcb-render0-dev libxcb-xtest0-dev libxcb-icccm4-dev libxcb-ewmh-dev \
#    libiconv-hook-dev libxcb-util0-dev  libxext-dev  libsdl2-dev freeglut3-dev libglew-dev \
 #   libglu1-mesa-dev libxmu-dev libxi-dev  build-essential ruby libesd0-dev cmake autoconf \
  #  libxcb-render0-dev libxcb-xtest0-dev libxcb-icccm4-dev libxcb-ewmh-dev  libiconv-hook-dev  \
   # libxcb-render-util0-dev libxcb-image0 libxcb-image0-dev libxcb-composite0-dev libxcb-damage0-dev \
   # libxcb-shm0-dev libxcb-xv0-dev   libbsd-dev libaudio-dev libxcb-render-util0-dev libxcb-image0-dev \
   # libpng-dev liblua5.1-0-dev liblua5.1-0 lua5.1 libluajit-5.1-2
RUN  sudo apt-get install -y build-essential libglew-dev libglu1-mesa-dev libxmu-dev \
     libxi-dev libsdl-dev libxxf86vm-dev libxmu-dev libxcb1-dev libxcb-randr0-dev \
     libxcb-util0-dev wget
ADD http://www.cmake.org/files/v3.2/cmake-3.2.2.tar.gz  cmake-3.2.2.tar.gz   
RUN tar -zxvf cmake-3.2.2.tar.gz   && cd  cmake-3.2.2 && ./configure && make 
ADD moai-dev moai-dev
ENV PATH "$PATH:/cmake-3.2.2/bin"
RUN cd moai-dev && chmod +x bin/build-linux.sh && ./bin/build-linux.sh
ENV MOAI_CONFIG=/moai-dev/samples/config
ENV MOAI_BIN=/moai-dev/build/build-linux/
ENV PATH "$PATH:$MOAI_BIN"
WORKDIR /moai-dev/samples
