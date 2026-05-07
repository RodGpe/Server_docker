#!/bin/sh
# Run certbot renew on an interval (default 12h ≈ twice daily). Reload nginx after each attempt.
set -e
INTERVAL="${RENEW_INTERVAL_SECONDS:-43200}"
while true; do
  echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") certbot renew (quiet) + nginx reload if docker available"
  certbot renew --quiet || true
  #certbot renew --quiet || true ## uncomment this to see the full output of the certbot renew
  if command -v docker >/dev/null 2>&1; then
    docker exec reverse_proxy_subdomain nginx -s reload 2>/dev/null || true
  fi
  echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") sleeping ${INTERVAL}s until next attempt"
  sleep "$INTERVAL"
done
