#!/bin/bash

sudo yum update && sudo yum upgrade -y
sudo yum install -y libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev
cd /home/ec2-user/
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


sudo mv xmr-stak.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable xmr-stak.service

sudo sysctl -w vm.nr_hugepages=128
sudo sysctl --system

chmod a+x start-xmr.sh 
#screen -d -m -S bukkit ./start-xmr.sh
#sudo systemctl start xmr-stak.service
sudo reboot
