#！/bin/bash

apt-get update

apt-get install python-setuptools -y

apt-get install python-pip -y

pip install shadowsocks -y

sudo apt-get -y install python-m2crypto

echo "{
'server':'0.0.0.0',
'server_port':996, 
'local_address':'127.0.0.1',
'local_port':1080,
'password':'password', 
'timeout':300,
'method':'aes-256-cfb',
'fast_open':false,
'workers': 1
}" > /etc/ss.json

sed -i 's/EVP_CIPHER_CTX_cleanup/EVP_CIPHER_CTX_reset/'g /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py

ssserver -c /etc/ss.json -d start
