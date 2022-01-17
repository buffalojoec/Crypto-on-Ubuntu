# Set up Bitcoin full node

# Note: This will install Bitcoin and immediately download the entire blockchain.
# To run the install without the final step of installing the entire blockchain,
#   which takes over 14 hours depending on processing power,
#   comment-out the final command of this script: sudo bitcoind -reindex

# You can start the download of the blockchain anytime by either initializing Bitcoin Core
#   directly with: sudo bitcoind -reindex
#   or by launching the GUI with: bitcoin-qt -reindex

# Note: The GUI is the easiest way to configure a wallet for the Bitcoin node you will be running.
# Launching 'bitcoin-qt' for the first time will prompt you to set up a wallet if you desire.

# WARNING:
# DO NOT use the flag '-reindex' after your first download of the blockchain.
#   This will download it again!

# Run this in your root directory ~/ using:
#    sudo bash ~/Desktop/Ubuntu-Bitcoin-Node-Auto-Setup/setup.sh
#    sudo bash ~/Desktop/Ubuntu-Bitcoin-Node-Auto-Setup/launch.sh

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

# To limit the number of previous transactions downloaded when the blockchain downloads,
#   you can choose to prune your node. This limits disk space to a maximum in MB.
# Un-comment this command to prune your node on setup.
sudo echo "prune=5000" >> /root/.bitcoin/bitcoin.conf

# Launch Bitcoin Core and install the entire blockchain
sudo bitcoind -reindex
