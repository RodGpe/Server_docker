Create your GoDaddy credentials file at:
`./secrets/godaddy.ini`

Then lock it down:

```bash
chmod 600 ./secrets/godaddy.ini
```

## TLS files nginx uses

After issuance or renewal, Certbot’s `deploy_hook` copies Let’s Encrypt `fullchain.pem` / `privkey.pem` (lineage `rodgpe.com`) into [../nginx_docker_files/cert/](../nginx_docker_files/cert/) as:

- `domain_certificate.crt` / `domain_private.key` — apex `rodgpe.com`
- `subdomain_certificate.crt` / `subdomain_private.key` — `*.rodgpe.com` server blocks

(One SAN cert is duplicated to both pairs; paths in nginx: [reverse_prox_conf/default.conf](../nginx_docker_files/reverse_prox_conf/default.conf).)

## First issuance (staging example)

Append `--deploy-hook '/usr/local/bin/deploy-nginx-certs.sh'` so PEMs are installed and the hook is stored in renewal config:

```bash
docker compose run --rm certbot-godaddy \
  certonly \
  --server https://acme-staging-v02.api.letsencrypt.org/directory \
  --authenticator dns-godaddy \
  --dns-godaddy-credentials /root/.secrets/certbot/godaddy.ini \
  --dns-godaddy-propagation-seconds 150 \
  -d '*.rodgpe.com' -d rodgpe.com \
  --deploy-hook '/usr/local/bin/deploy-nginx-certs.sh'
```

## Production issuance

Use the default Let’s Encrypt directory (omit `--server` staging). Same deploy hook:

```bash
docker compose run --rm certbot-godaddy \
  certonly \
  --authenticator dns-godaddy \
  --dns-godaddy-credentials /root/.secrets/certbot/godaddy.ini \
  --dns-godaddy-propagation-seconds 150 \
  -d '*.rodgpe.com' -d rodgpe.com \
  --deploy-hook '/usr/local/bin/deploy-nginx-certs.sh'
```

Staging certs are not trusted by browsers; use production before going live.

## Automatic renewal (Docker only)

Start the renew loop (same image/volumes as above; reloads nginx via Docker socket after each `renew` attempt):

```bash
docker compose up -d certbot-renew
```

- Interval default: 12 hours (`RENEW_INTERVAL_SECONDS` in Compose can override).
- `certbot-renew` mounts `/var/run/docker.sock` so it can run `docker exec reverse_proxy_subdomain nginx -s reload`. This is powerful; only run on hosts you trust.

## Operational checks

Dry-run renewal (ACME + hooks):

```bash
docker compose run --rm certbot-godaddy renew --dry-run
```

Reload nginx manually if needed:

```bash
docker exec reverse_proxy_subdomain nginx -s reload
```

Keep host time in sync (NTP); clock skew breaks ACME.
