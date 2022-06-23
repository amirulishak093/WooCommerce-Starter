#!/bin/bash

set -e

source "../.env"

NGINX_SSL_CERTS=$(echo "$NGINX_SSL_CERTS")

openssl req -x509 -outform pem -out chain.pem -keyout privkey.pem \
  -newkey rsa:4096 -nodes -sha256 -days 3650 \
  -subj '/CN=localhost' -extensions EXT -config <( \
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

cat chain.pem > fullchain.pem

mkdir -p ../${NGINX_SSL_CERTS}

find . -type f -name "*.pem" -exec mv {} ../${NGINX_SSL_CERTS} \;