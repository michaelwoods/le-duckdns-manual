#!/usr/bin/env bash

### https://serverfault.com/questions/44618/is-a-wildcard-cname-dns-record-valid

# Duck DNS domain challenge
certbot \
    --text --agree-tos --email $EMAIL \
    --expand --renew-by-default \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --configurator certbot-external-auth:out \
    --certbot-external-auth:out-public-ip-logging-ok \
    -d $DUCKDOMAIN \
    --preferred-challenges dns \
    --certbot-external-auth:out-handler /dns/scripts/duckdns-dns-challenge-hook.sh \
    --certbot-external-auth:out-dehydrated-dns \
    run

# Google DNS interactive challenge
certbot \
    --text --agree-tos --email $EMAIL \
    --expand --renew-by-default \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --manual \
    --manual-public-ip-logging-ok \
    -d $MANUALDOMAIN \
    --preferred-challenges dns \
    certonly
