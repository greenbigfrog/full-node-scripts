#!/bin/bash
apt update
apt -y upgrade
apt -y install htop ufw aria2
wget https://github.com/dogecoin/dogecoin/releases/download/v1.10.0/dogecoin-1.10.0-linux64.tar.gz
tar -zxvf dogecoin-1.10.0-linux64.tar.gz
mkdir ~/.dogecoin
echo 'rpcuser=sgdsdg' >> ~/.dogecoin/dogecoin.conf
echo 'rpcpassword=dgskgdsk' >> ~/.dogecoin/dogecoin.conf
wget http://jrn.me.uk/dogecoin_torrents/bootstrap_2018-01-09.dat.torrent
aria2c --dir=/root/.dogecoin/ --seed-time=10 bootstrap_2018-01-09.dat.torrent
~/dogecoin-1.10.0/bin/dogecoind &
echo 'setting up firewall'
ufw allow 22
ufw allow 22556
ufw --force enable
echo 'enabling swap'
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' >> /etc/fstab
