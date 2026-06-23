#!/bin/sh
# Run certbot renew on an interval (default 12h). Reload nginx after each attempt.
set -e
INTERVAL="${RENEW_INTERVAL_SECONDS:-43200}"

while true; do
  echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") certbot renew starting"

  if ! /usr/local/bin/check-renewal-config.sh; then
    echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") renewal skipped: fix staging ACME server in /etc/letsencrypt/renewal/*.conf" >&2
  elif certbot renew --quiet --no-random-sleep-on-renew; then
    echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") certbot renew succeeded"
  else
    echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") certbot renew failed (see /var/log/letsencrypt/letsencrypt.log)" >&2
  fi

  if command -v docker >/dev/null 2>&1; then
    docker exec reverse_proxy_subdomain nginx -s reload 2>/dev/null || true
  fi

  echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") sleeping ${INTERVAL}s until next attempt"
  sleep "$INTERVAL"
done
