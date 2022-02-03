#!/bin/bash

# AMD GPU setup script for Ubuntu machines.
# This particular script is for GPU model:
#     NVIDIA GeForce RTX 3060
#

# To run this script, run it with sudo bash from the home directory ~/

# Update Ubuntu
sudo apt update && sudo apt-get update
sudo apt dist-upgrade
sudo apt install -y wget

# Download NVIDIA CUDA toolkit
sudo apt install nvidia-cuda-toolkit
nvcc --version

# Configure Driver Software
??

# Configure CUDA repository
sudo wget -O /etc/apt/preferences.d/cuda-repository-pin-600 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"

# Download NVIDIA CUDA
sudo apt update
sudo apt install cuda
sudo apt upgrade nvidia-cuda-toolkit cuda -y

# Download Mining Software: LOL Miner
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.42/lolMiner_v1.42_Lin64.tar.gz
tar -xf lolMiner_v1.42_Lin64.tar.gz

echo -e "\n\nInstall successful. You are ready to mine.\n\n"
echo "To start mining, open one of the shell scripts in the LOLMiner folder, such as mine_eth.sh"
echo -e "\n\nYou''ll need to paste in your wallet address and run the script with sudo\n\n"

echo -e "\n\nYour machine will now restart\n\n"
sleep 10
sudo reboot
