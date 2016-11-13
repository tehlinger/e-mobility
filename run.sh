#!/bin/bash
sudo iptables -F 
sudo fuser -k 80/tcp
#sudo sh redirect.sh
sudo /home/pi/.gem/ruby/2.2.1/bin/bundle exec passenger start
sudo sh iptables.sh
