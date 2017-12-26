#!/bin/bash
apt update
apt -y upgrade
apt -y install htop ufw
wget https://github.com/dogecoin/dogecoin/releases/download/v1.10.0/dogecoin-1.10.0-linux64.tar.gz
tar -zxvf dogecoin-1.10.0-linux64.tar.gz
mkdir ~/.dogecoin
echo 'rpcuser=sgdsdg' >> ~/.dogecoin/dogecoin.conf
echo 'rpcpassword=dgskgdsk' >> ~/.dogecoin/dogecoin.conf
aria2c --dir=~/.dogecoin/ --seed-time=10 'magnet:?xt=urn:btih:5d0bd944a910f721b526e3613204e78a153ced62&dn=bootstrap.dat&tr=udp%3A%2F%2Feddie4.nl%3A6969%2Fannounce&tr=udp%3A%2F%2Finferno.demonoid.pw%3A3395%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=http%3A%2F%2Fglotorrents.pw%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Fp4p.arenabg.com%3A1337&tr=http%3A%2F%2Fipv4.tracker.harry.lu%2Fannounce&tr=http%3A%2F%2Fmgtracker.org%3A2710%2Fannounce&tr=udp%3A%2F%2Fbuyvm.theoks.net%3A6969%2Fannounce'
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
