#!/bin/bash
cd /xmr

sysctl -w vm.nr_hugepages=128
sysctl --system
ulimit -l

wallet=$(wget -qO- https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/walletaddress.txt)
server=$(wget -qO- https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/poolserver.txt)

./xmr-stak-rx --noTest -c config.txt -C pools.txt --cpu cpu.txt --log xmr-stak.log  --currency monero -r $(hostname) -u $wallet -o $server
