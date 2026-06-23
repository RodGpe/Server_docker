#!/bin/sh
# Refuse staging / untrusted issuers before they reach nginx.
set -e

cert_path="${1:?usage: verify-production-cert.sh <fullchain.pem>}"
issuer="$(openssl x509 -in "$cert_path" -noout -issuer 2>/dev/null)" || {
  echo "verify-production-cert: cannot read certificate: $cert_path" >&2
  exit 1
}

case "$issuer" in
  *STAGING*|*"(STAGING)"*)
    echo "verify-production-cert: refusing staging certificate" >&2
    echo "  issuer: $issuer" >&2
    exit 1
    ;;
esac

if ! echo "$issuer" | grep -qi "Let's Encrypt"; then
  echo "verify-production-cert: issuer is not Let's Encrypt" >&2
  echo "  issuer: $issuer" >&2
  exit 1
fi
