#!/bin/bash
sudo iptables -F 
sudo fuser -k 80/tcp
#sudo sh redirect.sh
sudo bundle exec passenger start
sudo sh iptables.sh
