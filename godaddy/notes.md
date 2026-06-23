Create your GoDaddy credentials file at:
`./secrets/godaddy.ini`

Required keys (see [certbot-dns-godaddy](https://github.com/miigotu/certbot-dns-godaddy)):

```ini
dns_godaddy_key = YOUR_KEY
dns_godaddy_secret = YOUR_SECRET
```

Then lock it down:

```bash
chmod 600 ./secrets/godaddy.ini
```

## TLS files nginx uses

After issuance or renewal, the deploy hook copies Let’s Encrypt `fullchain.pem` / `privkey.pem` (lineage `rodgpe.com`) into [../nginx_docker_files/cert/](../nginx_docker_files/cert/) as:

- `domain_certificate.crt` / `domain_private.key` — apex `rodgpe.com`
- `subdomain_certificate.crt` / `subdomain_private.key` — `*.rodgpe.com` server blocks

(One SAN cert is duplicated to both pairs; paths in nginx: [reverse_prox_conf/default.conf](../nginx_docker_files/reverse_prox_conf/default.conf).)

**Important:** nginx gets `fullchain.pem`, not `cert.pem`. The deploy hook refuses staging certificates.

## Production issuance (use this)

```bash
docker compose run --rm certbot-godaddy issue-production.sh
```

Force renewal (e.g. after fixing a bad config):

```bash
docker compose run --rm certbot-godaddy issue-production.sh --force-renewal
```

Or manually (same flags the helper uses):

```bash
docker compose run --rm certbot-godaddy \
  certonly --non-interactive --agree-tos \
  --server https://acme-v02.api.letsencrypt.org/directory \
  --authenticator dns-godaddy \
  --dns-godaddy-credentials /root/.secrets/certbot/godaddy.ini \
  --dns-godaddy-propagation-seconds 150 \
  -d '*.rodgpe.com' -d rodgpe.com \
  --deploy-hook '/usr/local/bin/deploy-nginx-certs.sh'
```

Verify the cert on disk:

```bash
openssl x509 -in ../nginx_docker_files/cert/domain_certificate.crt -noout -issuer -dates
```

Issuer must be `Let's Encrypt` (e.g. R13, E7, YE2) — **not** `(STAGING)`.

## Staging (dev / DNS tests only)

Do **not** use staging on a live site. Staging certs are not trusted by browsers.

If you must test ACME + DNS without rate limits:

```bash
docker compose run --rm certbot-godaddy \
  certonly --non-interactive --agree-tos \
  --server https://acme-staging-v02.api.letsencrypt.org/directory \
  --authenticator dns-godaddy \
  --dns-godaddy-credentials /root/.secrets/certbot/godaddy.ini \
  --dns-godaddy-propagation-seconds 150 \
  -d '*.rodgpe.com' -d rodgpe.com
```

Omit `--deploy-hook` so staging PEMs are never copied to nginx.

## Automatic renewal (Docker only)

Rebuild the image after script changes, then start the renew loop:

```bash
docker compose build
docker compose up -d certbot-renew
```

- Interval default: 12 hours (`RENEW_INTERVAL_SECONDS` in Compose can override).
- Before each renew, `check-renewal-config.sh` blocks renewal if any `renewal/*.conf` still points at staging.
- On success, `deploy-nginx-certs.sh` runs via the stored deploy hook and refuses staging issuers.
- `certbot-renew` mounts `/var/run/docker.sock` to reload nginx. Only run on hosts you trust.

After changing scripts in `scripts/`, rebuild and recreate the renew container:

```bash
docker compose build certbot-renew && docker compose up -d --force-recreate certbot-renew
```

## Operational checks

Dry-run renewal (production ACME + hooks):

```bash
docker compose run --rm certbot-godaddy renew --dry-run
```

Reload nginx manually if needed:

```bash
docker exec reverse_proxy_subdomain nginx -s reload
```

Keep host time in sync (NTP); clock skew breaks ACME.

## Troubleshooting invalid certificate

1. Check nginx cert issuer: `openssl x509 -in ../nginx_docker_files/cert/domain_certificate.crt -noout -issuer`
2. Check renewal config: `grep server letsencrypt/renewal/rodgpe.com.conf` — must be `acme-v02`, not `acme-staging-v02`.
3. Re-issue production: `docker compose run --rm certbot-godaddy issue-production.sh --force-renewal`
4. Reload nginx: `docker exec reverse_proxy_subdomain nginx -s reload`
