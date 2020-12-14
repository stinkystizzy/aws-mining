#!/bin/bash
cd /home/ubuntu/xmr

sudo sysctl -w vm.nr_hugepages=128
sudo sysctl --system
ulimit -l

wallet=$(wget -qO- https://xmrfiles.s3-us-west-2.amazonaws.com/walletaddress.txt)
server=$(wget -qO- https://xmrfiles.s3-us-west-2.amazonaws.com/poolserver.txt)

./xmr-stak-rx --noTest -c config.txt -C pools.txt --cpu cpu.txt --log xmr-stak.log  --currency monero -r $(hostname) -u $wallet -o $server