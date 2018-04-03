#!/bin/sh

export NODE_ENV='production'
node ./app.js &

mkdir -p challenges

/usr/bin/certbot certonly \
    --non-interactive \
    --agree-tos \
    --webroot \
    --webroot-path ./challenges \
    --no-self-upgrade \
    --email $CERTBOT_EMAIL \
    --domains $CERTBOT_DOMAINS
