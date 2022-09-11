#!/bin/bash

version="4.6.0"

set -e

echo "--------------------------------------"
echo "** Removing old OpenCV.          [1/5]"
echo "--------------------------------------"
apt -y purge *libopencv*

echo "--------------------------------------"
echo "** Installing required packages. [2/5]"
echo "--------------------------------------"
apt-get install -y --no-install-recommends
apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp

echo "--------------------------------------"
echo "** Downloading the source code.  [3/5]"
echo "--------------------------------------"
mkdir opencv
cd opencv

curl -L https://github.com/opencv/opencv/archive/${version}.zip -o opencv.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${version}.zip -o opencv_contrib.zip

unzip opencv.zip
unzip opencv_contrib.zip

mv opencv-${version} opencv
mv opencv_contrib-${version} opencv_contrib

rm opencv.zip opencv_contrib.zip
cd opencv

mkdir release
cd release

echo "--------------------------------------"
echo "** Building OpenCV.              [4/5]"
echo "--------------------------------------"
cmake   -D WITH_CUDA=ON \
        -D WITH_CUDNN=ON \
        -D CUDA_ARCH_BIN=7.2 \
        -D CUDA_ARCH_PTX="" \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D WITH_GSTREAMER=ON \
        -D WITH_LIBV4L=ON \
        -D WITH_OPENCL=OFF \
        -D WITH_OPENMP=ON \
        -D WITH_TBB=ON \
        -D BUILD_TBB=ON \
        -D BUILD_opencv_python3=ON \
        -D PYTHON3_PACKAGES_PATH=/usr/lib/python3/dist-packages \
        -D BUILD_TESTS=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D BUILD_EXAMPLES=OFF \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local ..

make -j$(nproc)
make install
make clean

echo "--------------------------------------"
echo "** Cleaning up.                  [5/5]"
echo "--------------------------------------"
cd /
rm -rf oepncv opencv_contrib