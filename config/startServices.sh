#!/bin/bash

# Forgot, pipeline doesn't like installing some stuff, installing here
# *** Commenting out as testing is no longer active ***
# apt update
# apt install -y openssh-server

cd /opt/acme/acme.sh
# Using --force so it'll install without cron being installed
echo $sslUser
./acme.sh --install --force -m $sslUser

# *** Commenting out as testing is no longer active ***
# mkdir /run/sshd
# /usr/sbin/sshd -D

time /opt/sslManager -verbose -debug