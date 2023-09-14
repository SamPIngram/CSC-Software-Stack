#!/bin/bash
# switch out christie certificates with your own.

cp /etc/ssl/certs/cht-topol.xchristie.nhs.uk-withchain.crt ~/ssl/cert.pem
cp /etc/ssl/certs/cht-topol.xchristie.nhs.uk.key ~/ssl/cert.key

echo "Certificates Copied! Restart Container. :)"