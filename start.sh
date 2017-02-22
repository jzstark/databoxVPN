#!/bin/sh

sudo apt-get install pandoc

cd openvpn
sh start.sh
cd ../l2tp
sh start.sh
cd ..

cp openvpn/databox.ovpn nginx/html/
cp openvpn/start.sh nginx/html/
cp l2tp/l2tp.md nginx/html/



docker run --name docker-nginx -p 80:80 -v $DIR/html:/usr/share/nginx/html -v $DIR/default.conf:/etc/nginx/conf.d/default.conf -d nginx:alpine
