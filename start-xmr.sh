#!/bin/bash
cd /home/ec2-user/xmr

sudo sysctl -w vm.nr_hugepages=128
sudo sysctl --system
ulimit -l

wallet=$(wget -qO- https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/walletaddress.txt)
server=$(wget -qO- https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/poolserver.txt)

#./xmr-stak-rx --noTest -c config.txt --cpu cpu.txt --log xmr-stak.log  --currency monero -r $(hostname) -u $wallet -o $server
./xmr-stak-rx --noTest -c config.txt -C pools.txt --cpu cpu.txt --log xmr-stak.log  --currency monero -r $(hostname) 
