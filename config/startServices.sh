#!/bin/bash

export LE_WORKING_DIR="/root/.acme.sh"
export LE_CONFIG_HOME="/root/acme.sh/data"
export PDNS_Ttl=60

cd /opt/acme/acme.sh
# Using --force so it'll install without cron being installed
echo $sslUser
./acme.sh --install --force -m $sslUser
/root/.acme.sh/acme.sh --register-account -m $sslUser;

# Do the cert check/renewal, output goes to STDOUT
/opt/sslManager -verbose -debug

# Sleep for 2 hours after completion to allow for system access
/bin/sleep 7200