#!/bin/bash

# Forgot, pipeline doesn't like installing some stuff, installing here
apt update
apt install -y openssh-server

cd /opt/acme/acme.sh
# Using --force so it'll install without cron being installed
echo $sslUser
./acme.sh --install --force -m $sslUser


mkdir /run/sshd
/usr/sbin/sshd -D
