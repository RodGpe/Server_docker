#!/bin/sh
# Issue or force-renew a production certificate (never staging).
set -e

DOMAINS_APEX="${CERTBOT_DOMAINS_APEX:-rodgpe.com}"
DOMAINS_WILDCARD="${CERTBOT_DOMAINS_WILDCARD:-*.rodgpe.com}"
PROPAGATION="${CERTBOT_DNS_PROPAGATION_SECONDS:-150}"
CREDS="${CERTBOT_GODADDY_CREDENTIALS:-/root/.secrets/certbot/godaddy.ini}"
DEPLOY_HOOK="${CERTBOT_DEPLOY_HOOK:-/usr/local/bin/deploy-nginx-certs.sh}"

extra_args=""
if [ "${1:-}" = "--force-renewal" ]; then
  extra_args="--force-renewal"
  shift
fi

exec certbot certonly \
  --non-interactive \
  --agree-tos \
  $extra_args \
  --server https://acme-v02.api.letsencrypt.org/directory \
  --authenticator dns-godaddy \
  --dns-godaddy-credentials "$CREDS" \
  --dns-godaddy-propagation-seconds "$PROPAGATION" \
  -d "$DOMAINS_WILDCARD" \
  -d "$DOMAINS_APEX" \
  --deploy-hook "$DEPLOY_HOOK" \
  "$@"
