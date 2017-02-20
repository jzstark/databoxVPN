#!/bin/sh


# Start a ningx server
DIR=`pwd`
docker run --name docker-nginx -p 80:80 -v $DIR/html:/usr/share/nginx/html -v $DIR/default.conf:/etc/nginx/conf.d/default.conf -d nginx:alpine

sh ./openvpn/generate.sh
sh ./l2tp/introduction.sh

mv ovpn.config $DIR/html/
# change openvpn.md $DIR/html/openvpn.html

