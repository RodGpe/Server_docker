#!/bin/sh
set -e
# Copy Let's Encrypt PEMs into the nginx bind-mounted cert dir.
LINEAGE="${CERTBOT_LINEAGE:-rodgpe.com}"
LIVE="/etc/letsencrypt/live/${LINEAGE}"
OUT="${NGINX_CERT_OUTPUT:-/output}"

fullchain=$(readlink -f "${LIVE}/fullchain.pem")
privkey=$(readlink -f "${LIVE}/privkey.pem")

## test names for the apex and wildcard certs
#install -m 644 "$fullchain" "${OUT}/rodgpe_apex.crt"
#install -m 600 "$privkey" "${OUT}/rodgpe_apex.key"
#install -m 644 "$fullchain" "${OUT}/rodgpe_wildcard.crt"
#install -m 600 "$privkey" "${OUT}/rodgpe_wildcard.key"

#names for the production apex and wildcard certs
install -m 644 "$fullchain" "${OUT}/domain_certificate.crt"
install -m 600 "$privkey" "${OUT}/domain_private.key"
install -m 644 "$fullchain" "${OUT}/subdomain_certificate.crt"
install -m 600 "$privkey" "${OUT}/subdomain_private.key"