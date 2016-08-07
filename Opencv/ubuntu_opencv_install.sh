#! /bin/bash
# Ubuntu 14.04 Opencv => Opencv 2.4.13, GCC 4.9.3(Default), Python 2.7.6(Default)

LightCyan='\033[0;36m'
NC='\033[0m'
# apt-get update
printf "${LightCyan}======================== ${NC} \n"
printf "${LightCyan}===- apt-get update -=== ${NC} \n"
printf "${LightCyan}======================== ${NC} \n"
sudo apt-get -y update

# [compiler] Install build-essential
printf "${LightCyan}================================== ${NC} \n"
printf "${LightCyan} ===- Install build-essential -=== ${NC} \n"
printf "${LightCyan}================================== ${NC} \n"
sudo apt-get -y install build-essential

# [required] Install Essential Package
printf "${LightCyan}=================================== ${NC} \n"
printf "${LightCyan}===- Install Essential Package -=== ${NC} \n"
printf "${LightCyan}=================================== ${NC} \n"
sudo apt-get -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

# [optional]  Install Opencv Essential Package (libopencv-dev is most important library for ubnutu runing opancv)
printf "${LightCyan}=================================== ${NC} \n"
printf "${LightCyan}===- Install Essential Package -=== ${NC} \n"
printf "${LightCyan}=================================== ${NC} \n"
sudo apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev libopencv-dev

# Install Opencv From Git Resource Package
printf "${LightCyan}================================================== ${NC} \n"
printf "${LightCyan}===- Install Opencv From Git Resource Package -=== ${NC} \n"
printf "${LightCyan}================================================== ${NC} \n"
sudo apt-get -y install git
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

# [ Reference ]
# http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html
# http://askubuntu.com/questions/334158/installing-opencv
