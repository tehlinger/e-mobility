#!/bin/bash
mac=`arp -a | grep $1 | cut -d ' ' -f 4`
echo $mac
sudo iptables -D internet -t mangle -m mac --mac-source $mac -j RETURN 
sudo ip6tables -D internet -t mangle -m mac --mac-source $mac -j RETURN
