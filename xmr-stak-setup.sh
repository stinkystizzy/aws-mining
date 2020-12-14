#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev
wget https://github.com/fireice-uk/xmr-stak/releases/download/1.0.5-rx/xmr-stak-rx-linux-1.0.5-cpu.tar.xz
tar xf xmr-stak-rx-linux-1.0.5-cpu.tar.xz
mv  xmr-stak-rx-linux-1.0.5-cpu/  xmr
cd xmr/ 

#download config.txt file
wget https://xmrfiles.s3-us-west-2.amazonaws.com/config.txt
wget https://xmrfiles.s3-us-west-2.amazonaws.com/cpu.txt
wget https://xmrfiles.s3-us-west-2.amazonaws.com/pools.txt
wget https://xmrfiles.s3-us-west-2.amazonaws.com/start-xmr.sh
wget https://xmrfiles.s3-us-west-2.amazonaws.com/xmr-stak.service

sudo mv xmr-stak.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable xmr-stak.service

sudo sysctl -w vm.nr_hugepages=128
sudo sysctl --system

chmod a+x start-xmr.sh 
#screen -d -m -S bukkit ./start-xmr.sh
#sudo systemctl start xmr-stak.service
sudo reboot
