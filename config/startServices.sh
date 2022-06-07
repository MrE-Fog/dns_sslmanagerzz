#!/bin/bash

cd /opt/acme/acme.sh
# Using --force so it'll install without cron being installed
echo $sslUser
./acme.sh --install --force -m $sslUser


which sshd
/usr/sbin/sshd -D
