FROM ubuntu:14.04
RUN apt-get update

#lua and stuff to build imagemagick/lua-imagemagick
RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    lua5.1 \
    luajit \
    cmake \
    luajit-5.1-dev \
    wget build-essential

# build imagemagick
RUN wget http://www.imagemagick.org/download/ImageMagick.tar.gz && \
  tar xvzf ImageMagick.tar.gz && \
  cd ImageMagick-6.9.3-7 && \
  ./configure && \
  make && \
  make install && \
  cd ..

# build lua-imagick
RUN git clone https://github.com/isage/lua-imagick.git && \
  cd lua-imagick && \
  mkdir build && \
  cd build && \
  cmake .. && \
  make && \
  make install
