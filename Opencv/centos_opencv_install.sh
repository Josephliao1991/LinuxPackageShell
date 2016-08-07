#! /bin/bash
# CentOS 6.7 Opencv => Opencv 2.4.13, GCC 4.9.3, Python 2.6.6(Default)

# Fix Nodejs 4.0.0 Version Bug,
# Ubuntu 12.02 With The Same Problem.
# ../node_modules/nan/nan.h:41:3: error: #error This version of node/NAN/v8 requires a C++11 compiler
# Upgrade GCC to 4.9
LightCyan='\033[0;36m'
NC='\033[0m'
printf "${LightCyan}=================================================== ${NC} \n"
printf "${LightCyan}===-  Fix Nodejs 4.x.x Bug, Upgrade GCC to 4.9 -=== ${NC} \n"
printf "${LightCyan}=================================================== ${NC} \n"

# Download RPM Package
printf "${LightCyan}============================== ${NC} \n"
printf "${LightCyan}===- Download RPM Package -=== ${NC} \n"
printf "${LightCyan}============================== ${NC} \n"
rpm -ivh https://www.softwarecollections.org/en/scls/rhscl/devtoolset-3/epel-6-x86_64/download/rhscl-devtoolset-3-epel-6-x86_64.noarch.rpm

# Install
# devtoolset-3-gcc will be embedded
printf "${LightCyan}==================================== ${NC} \n"
printf "${LightCyan}===- Install : devtoolset-3-gcc -=== ${NC} \n"
printf "${LightCyan}==================================== ${NC} \n"
yum -y install devtoolset-3-gcc-c++

# Overide System-GCC Temporarily
# scl enable devtoolset-3 bash

# Overide System-GCC.
printf "${LightCyan}========================================= ${NC} \n"
printf "${LightCyan}===- Overide System-GCC With GCC-4.9 -=== ${NC} \n"
printf "${LightCyan}========================================= ${NC} \n"
source /opt/rh/devtoolset-3/enable

# Update Yum
printf "${LightCyan}==================== ${NC} \n"
printf "${LightCyan}===- Update Yum -=== ${NC} \n"
printf "${LightCyan}==================== ${NC} \n"
yum -y update --skip-broken

# Install Develope Tool
printf "${LightCyan}=============================== ${NC} \n"
printf "${LightCyan}===- Install Develope Tool -=== ${NC} \n"
printf "${LightCyan}=============================== ${NC} \n"
yum -y groupinstall 'Development Tools'

# Install Opencv Essential Package
printf "${LightCyan}========================================== ${NC} \n"
printf "${LightCyan}===- Install Opencv Essential Package -=== ${NC} \n"
printf "${LightCyan}========================================== ${NC} \n"
yum -y install cmake python-devel numpy

# Install GTK To support GUI features, Camera support (libdc1394, libv4l), Media Support (ffmpeg, gstreamer)
printf "${LightCyan}============================================== ${NC} \n"
printf "${LightCyan}===-  Install GTK To support GUI features -=== ${NC} \n"
printf "${LightCyan}===-  Camera support (libdc1394, libv4l)  -=== ${NC} \n"
printf "${LightCyan}===-  Media Support (ffmpeg, gstreamer)   -=== ${NC} \n"
printf "${LightCyan}============================================== ${NC} \n"
yum -y install gtk2-devel libdc1394-devel libv4l-devel ffmpeg-devel gstreamer-plugins-base-devel

# Optional Dependencies:
# Install below pakcages if you need latest libraries of PNG, JPEG, JPEG2000, TIFF, WebP.
printf "${LightCyan}====================================================================================== ${NC} \n"
printf "${LightCyan}===- Optional Dependencies : latest libraries of PNG, JPEG, JPEG2000, TIFF, WebP. -=== ${NC} \n"
printf "${LightCyan}====================================================================================== ${NC} \n"
yum -y install libpng-devel libjpeg-turbo-devel jasper-devel openexr-devel libtiff-devel libwebp-devel

# Export Library Path
printf "${LightCyan}============================= ${NC} \n"
printf "${LightCyan}===- Export Library Path -=== ${NC} \n"
printf "${LightCyan}============================= ${NC} \n"
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> ~/.bashrc
echo 'export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig' >> ~/.bashrc
source ~/.bashrc

# Install Opencv From Git Resource Package
printf "${LightCyan}================================================== ${NC} \n"
printf "${LightCyan}===- Install Opencv From Git Resource Package -=== ${NC} \n"
printf "${LightCyan}================================================== ${NC} \n"
yum -y install git
mkdir opencv-build
cd opencv-build
git clone https://github.com/Itseez/opencv.git
cd opencv

printf "${LightCyan}========================================== ${NC} \n"
printf "${LightCyan}===- Checkout To Tags/2.4.13 Version. -=== ${NC} \n"
printf "${LightCyan}========================================== ${NC} \n"
git checkout tags/2.4.13

printf "${LightCyan}============================= ${NC} \n"
printf "${LightCyan}===- CMake Compiler File -=== ${NC} \n"
printf "${LightCyan}============================= ${NC} \n"
cmake -DWITH_FFMPEG=OFF

printf "${LightCyan}=============================== ${NC} \n"
printf "${LightCyan}===- Start Compiler OpenCV -=== ${NC} \n"
printf "${LightCyan}=============================== ${NC} \n"
make

printf "${LightCyan}======================== ${NC} \n"
printf "${LightCyan}===- Install OpenCV -=== ${NC} \n"
printf "${LightCyan}======================== ${NC} \n"

make install

printf "${LightCyan}=================================== ${NC} \n"
printf "${LightCyan}===- Install OpenCV With 'npm' -=== ${NC} \n"
printf "${LightCyan}=================================== ${NC} \n"

printf "${LightCyan}=================================== ${NC} \n"
printf "${LightCyan}===- Run Following Command To Install OpenCV With 'NPM' -=== ${NC} \n"
printf "${LightCyan}'CC=/opt/rh/devtoolset-3/root/usr/bin/gcc CXX=/opt/rh/devtoolset-3/root/usr/bin/gcc npm install opencv --unsafe-perm' ${NC} \n"
printf "${LightCyan}=================================== ${NC} \n"

# CC=/opt/rh/devtoolset-3/root/usr/bin/gcc CXX=/opt/rh/devtoolset-3/root/usr/bin/gcc npm install opencv --unsafe-perm



# [ Reference ]
# rpm -ivh https://www.softwarecollections.org/en/scls/rhscl/devtoolset-3/epel-6-x86_64/download/rhscl-devtoolset-3-epel-6-x86_64.noarch.rpm
#
# yum install devtoolset-3-gcc-c++
# #devtoolset-3-gcc Installed
# source /opt/rh/devtoolset-3/enable
#
# centos 6安裝OPENCV的方式
# http://my.oschina.net/wwfifi/blog/525771
# The Problem Is After nodes 4.XX, node-gyp's default gcc version must grather than 4.8.0,
#  ===> https://github.com/ncb000gt/node.bcrypt.js/issues/90
# Install opencv
# https://www.unzeen.com/article/2741/
# http://techieroop.com/install-opencv-in-centos/

# Upgrade gcc With Version 4.9.3
# https://blog.bangbang93.com/2015/10/09/centos6%E4%B8%8A%E6%AD%A3%E5%B8%B8%E4%BD%BF%E7%94%A8node-4-0-0%E4%BB%A5%E4%B8%8A%E7%9A%84node-gyp.moe
# rpm -ivh https://www.softwarecollections.org/en/scls/rhscl/devtoolset-3/epel-6-x86_64/download/rhscl-devtoolset-3-epel-6-x86_64.noarch.rpm
# yum install devtoolset-3-gcc-c++
# echo "source /opt/rh/devtoolset-3/enable" >>/etc/profile
# source /opt/rh/devtoolset-3/enable
# ls /opt/rh/devtoolset-3/root/usr/bin/
#
# Point To gcc version 4.9.3
# CC=/opt/rh/devtoolset-3/root/usr/bin/gcc CXX=/opt/rh/devtoolset-3/root/usr/bin/gcc npm install opencv
# https://docs.npmjs.com/misc/config
