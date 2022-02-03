#!/bin/bash

# NVIDIA GPU setup script for Windows machines.
# This particular script is for GPU model:
#     NVIDIA GeForce RTX 3060
#

# To run this script, run it with sudo bash from the home directory ~/

# Update Ubuntu
sudo apt update && sudo apt-get update
sudo apt dist-upgrade
sudo apt install -y wget

# Configure CUDA repository
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub

# Download NVIDIA CUDA
sudo apt update
sudo apt-get install -y cuda-toolkit-11-0

# Download Mining Software: LOL Miner
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.42/lolMiner_v1.42_Lin64.tar.gz
tar -xf lolMiner_v1.42_Lin64.tar.gz

echo -e "\n\nInstall successful. You are ready to mine.\n\n"
echo "To start mining, open one of the shell scripts in the LOLMiner folder, such as mine_eth.sh"
echo -e "\n\nYou''ll need to paste in your wallet address and run the script with sudo\n\n"
