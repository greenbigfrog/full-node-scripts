#!/bin/bash
apt update
apt -y upgrade
apt -y install htop ufw
wget https://github.com/dogecoin/dogecoin/releases/download/v1.10.0/dogecoin-1.10.0-linux64.tar.gz
tar -zxvf dogecoin-1.10.0-linux64.tar.gz
mkdir ~/.dogecoin
rpcuser=sgdsdg >> ~/.dogecoin/dogecoin.conf
rpcpassword=dgskgdsk >> ~/.dogecoin/dogecoin.conf
wget -O ~/.dogecoin/bootstrap.dat https://bootstrap.chain.so/bootstrap.dat
~/dogecoin-1.10.0/bin/dogecoind &
ufw allow 22
ufw allow 22556
ufw --force enable
