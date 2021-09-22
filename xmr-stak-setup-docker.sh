#!/bin/bash

apt update && apt upgrade -y && apt install wget
apt install -y libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev
cd /
wget https://github.com/fireice-uk/xmr-stak/releases/download/1.0.5-rx/xmr-stak-rx-linux-1.0.5-cpu.tar.xz
tar xf xmr-stak-rx-linux-1.0.5-cpu.tar.xz
mv  xmr-stak-rx-linux-1.0.5-cpu/  xmr
cd xmr/ 

#download config.txt file
wget https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/config.txt
wget https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/cpu.txt
wget https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/pools.txt
wget https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/start-xmr.sh
wget https://raw.githubusercontent.com/stinkystizzy/aws-mining/master/xmr-stak.service


mv xmr-stak.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable xmr-stak.service

sysctl -w vm.nr_hugepages=128
sysctl --system

chmod a+x start-xmr.sh 
#screen -d -m -S bukkit ./start-xmr.sh
#sudo systemctl start xmr-stak.service
reboot
