#!/bin/bash

# AMD GPU setup script for Ubuntu machines.
# This particular script is for GPU model:
#     NVIDIA GeForce RTX 3060
#

# To run this script, run it with sudo bash from the home directory ~/

# Update Ubuntu
sudo apt update
sudo apt dist-upgrade
sudo apt install -y wget

# Download NVIDIA CUDA Driver
wget https://developer.nvidia.com/51006-gameready-win11-win10-dch-64bit-international
chmod +x NVIDIA-Linux-x86_64-510.47.03.run
sudo ./NVIDIA-Linux-x86_64-510.47.03.run

# Configure Driver Software
sudo usermod -a -G render $LOGNAME
sudo usermod -a -G video $LOGNAME

# Configure OpenCL
sudo apt-get install -y clinfo
sudo apt upgrade amdgpu

# Download Mining Software: LOL Miner
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.42/lolMiner_v1.42_Lin64.tar.gz
tar -xf lolMiner_v1.42_Lin64.tar.gz

echo -e "\n\nInstall successful. You are ready to mine.\n\n"
echo "To start mining, open one of the shell scripts in the LOLMiner folder, such as mine_eth.sh"
echo -e "\n\nYou''ll need to paste in your wallet address and run the script with sudo\n\n"

echo -e "\n\nYour machine will now restart\n\n"
sleep 10
sudo reboot
