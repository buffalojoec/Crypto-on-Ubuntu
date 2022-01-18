## Working with Bitcoin Core on Ubuntu

If you ran the script in this folder, `install-bitcoin`, then you should have just 
successfully installed Bitcoin Core on your Ubuntu machine.

There are a few ways to launch Bitcoin Core, which I'll detail below:

```shell
bitcoind
```

This command will launch Bitcoin Core.

```shell
bitcoind -prune=5000
```

This command will launch Bitcoin Core and configure it to only use about 5 GB of disk space.

I chose to prune my node because - even though the Bitcoin documentation claims you need 
around 350 GB to download the entire blockchain - there is other data that comes along with 
the blocks, such as chainstate data, wallet data, etc. I didn't have enough disk memory for 
the entire blockchain.

```shell
bitcoin-qt
```

This command will launch the Bitcoin GUI - called Bitcoin QT - which gives the user a nice little GUI 
window to view various details about their wallet or the blockchain.

Note: `bitcoin-qt` launches `bitcoind` by default when it starts up. Make sure you provide the prune option if you are working with a pruned node:

```shell
bitcoin-qt -prune=5000
```

### How Pruning Works in Bitcoin Core

When you initialize `bitcoind` for the first time, your node has to validate every block 
in the entire blockchain. That's part of the design of Bitcoin. In order to do this, 
your node has to download all blocks and verify them one-by-one until it reaches present-day.

If you don't prune your node, `bitcoind` will download the entire blockchain and store it on the hard drive. This will enable you to do highly-secure things with your wallet & node, but you don't need to save the blockchain to the hard drive to run a node.

The minimum number of blocks required by a node is 288 and the minimum pruning amount above 0 is 550. If you prune your node, `bitcoind` will download the blockchain data as it would normally until it reaches your pruning target. Once there, it will flush (delete) any blocks from disk, but will keep other information such as chainstate, headers, etc. so it can function as a node.

The only drawback from a pruned node is the loss of ability to operate a highly-secure wallet from the machine. If this is your intention, you need to bump storage to at least 750 GB if you want any chance of using the computer for anything besides `bitcoind`.