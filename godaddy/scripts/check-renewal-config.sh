#!/bin/sh
# Ensure renewal configs target production ACME, not staging.
set -e

renewal_dir="${1:-/etc/letsencrypt/renewal}"
failed=0

if [ ! -d "$renewal_dir" ]; then
  echo "check-renewal-config: no renewal directory at $renewal_dir" >&2
  exit 0
fi

for conf in "$renewal_dir"/*.conf; do
  [ -f "$conf" ] || continue
  if grep -q 'acme-staging-v02\.api\.letsencrypt\.org' "$conf"; then
    echo "check-renewal-config: staging ACME server in $conf" >&2
    echo "  set server = https://acme-v02.api.letsencrypt.org/directory" >&2
    failed=1
  fi
done

exit "$failed"
