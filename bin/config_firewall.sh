#!/bin/bash

rpl "#net.ipv4.ip_forward=1" "net.ipv4.ip_forward=1" /etc/sysctl.conf
sysctl -p
ufw allow OpenSSH

cd /etc/ufw
patch <~/before.rules.patch

rpl "DEFAULT_FORWARD_POLICY=\"DROP\"" "DEFAULT_FORWARD_POLICY=\"ACCEPT\"" /etc/default/ufw

#ufw allow 1194/udp
ufw allow 1194/tcp
