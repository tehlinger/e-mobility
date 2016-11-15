sudo iptables -I internet 1 -t mangle -s $1 -j RETURN
echo `date`
echo 'sudo iptables -I internet 1 -t mangle -s' $1 '-j return' >> log.txt
sudo /usr/bin/rmtrack  $1
