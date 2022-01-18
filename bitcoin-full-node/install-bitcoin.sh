# Set up Bitcoin full node

# Note: This script will install all required dependencies for Bitcoin Core and
#   install Bitcoin core on your Ubuntu machine

# You can start the download of the blockchain anytime by either initializing Bitcoin Core
#   directly with: sudo bitcoind
#   or by launching the GUI with: bitcoin-qt

# Note: The GUI is the easiest way to configure a wallet for the Bitcoin node you will be running.
# Launching 'bitcoin-qt' for the first time will prompt you to set up a wallet if you desire.

#
# To run this script:
#    Run this in your root directory ~/ using sudo bash

# Update your system's repositories
sudo apt update
sudo apt-get update

# Install required dependencies
sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
sudo apt-get install -y libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev

# Install SQLLite for wallet
sudo apt install -y libsqlite3-dev

# Install port-mapping libraries
sudo apt install -y libminiupnpc-dev libnatpmp-dev

# ZMQ dependencies
sudo apt-get install -y libzmq3-dev

# User-Space, Statically Defined Tracing
sudo apt install -y systemtap-sdt-dev

# GUI Dependencies
sudo apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools

# Support for Wayland protocol
sudo apt install -y qtwayland5

# Clone the Bitcoin repository from GitHub
sudo apt install git
git clone https://github.com/bitcoin/bitcoin.git
cd bitcoin

# Configure the Bitcoin Core install & verify
sudo bash autogen.sh
sudo ./configure
# sudo make check

# Install Bitcoin Core
cd bitcoin/src
sudo make install
