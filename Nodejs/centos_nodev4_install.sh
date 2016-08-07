#! /bin/bash
# Install Nodejs _4.x.x In Centos
# Run as root on RHEL, CentOS or Fedora, for Node.js v4 LTS Argon:
LightCyan="\033[0;36m"
NC='\033[0m'
printf "${LightCyan}================================================== ${NC} \n"
printf "${LightCyan}===- Download Nodejs 4.x.x From Node Resource -=== ${NC} \n"
printf "${LightCyan}================================================== ${NC} \n"
curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -

# Then install, as root:
printf "${LightCyan}=========================== ${NC} \n"
printf "${LightCyan}===-  Install As Root. -=== ${NC} \n"
printf "${LightCyan}=========================== ${NC} \n"
yum -y install nodejs

# Optional: install build tools
# To compile and install native addons from npm you may also need to install build tools:
# yum install gcc-c++ make
# or:
# yum groupinstall 'Development Tools'
