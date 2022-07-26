#!/bin/bash
yum install git -y
git clone https://github.com/steamsv/socks5-rs.git
cp /root/socks5-rs/target/release/socks5-rs /usr/bin/socks5-rs
cp /root/socks5-rs/socks5-rs.service /etc/systemd/system/socks5-rs.service
chmod +x /usr/bin/socks5-rs
systemctl start socks5-rs
systemctl enable socks5-rs

#wget https://github.com/steamsv/socks5-rs/raw/main/install.sh && bash install.sh
