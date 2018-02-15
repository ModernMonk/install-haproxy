#!/bin/bash
sudo yum install gcc pcre-static pcre-devel -y
wget https://www.haproxy.org/download/1.8/src/haproxy-1.8.4.tar.gz -O $HOME/haproxy.tar.gz
tar xzvf $HOME/haproxy.tar.gz -C ~/
cd $HOME/haproxy-1.8.4
make TARGET=linux2628
sudo make install
sudo mkdir -p /etc/haproxy
sudo mkdir -p /var/lib/haproxy 
sudo touch /var/lib/haproxy/stats
sudo ln -s /usr/local/sbin/haproxy /usr/sbin/haproxy
sudo cp $HOME/haproxy-1.8.4/examples/haproxy.init /etc/init.d/haproxy
sudo chmod 755 /etc/init.d/haproxy
sudo systemctl daemon-reload
sudo chkconfig haproxy on
sudo useradd -r haproxy
