#!/bin/bash
sudo iptables -F
sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 80 -j DNAT  --to-destination  192.168.1.39:80
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
