#! /bin/bash
# Install Nodejs _4.x.x In Ubuntu 14.04
# Run as root on RHEL, CentOS or Fedora, for Node.js v4 LTS Argon:
LightCyan='\033[0;36m'
printf "${LightCyan}=================================================== ${NC} \n"
printf "${LightCyan}===-  Download Nodejs 4.x.x From Node Resource -=== ${NC} \n"
printf "${LightCyan}=================================================== ${NC} \n"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

# Then install, as root:
printf "${LightCyan}=========================== ${NC} \n"
printf "${LightCyan}===-  Install As Root. -=== ${NC} \n"
printf "${LightCyan}=========================== ${NC} \n"
sudo apt-get install -y nodejs
