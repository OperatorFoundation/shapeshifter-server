#!/bin/bash

apt-get update -y
sleep 5
apt-get update -y
sleep 5
apt-get install -y openvpn openvpn-blacklist easy-rsa rpl

make-cadir ca
cd ca
#FIXME - set vars
source ./vars
./clean-all
./build-ca --batch
./build-key-server --batch server
./build-dh
openvpn --genkey --secret keys/ta.key
./build-key --batch client1
cd keys
cp ca.crt ca.key server.crt server.key ta.key dh2048.pem /etc/openvpn
