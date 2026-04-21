Create your GoDaddy credentials file at:
./secrets/godaddy.ini

Then lock it down:
chmod 600 ./secrets/godaddy.ini


### command for testing
docker compose run --rm certbot-godaddy \
  certonly \
  --server https://acme-staging-v02.api.letsencrypt.org/directory \
  --authenticator dns-godaddy \
  --dns-godaddy-credentials /root/.secrets/certbot/godaddy.ini \
  --dns-godaddy-propagation-seconds 150 \
  -d '*.rodgpe.com' -d rodgpe.com

  ### command for prodoction

  docker compose run --rm certbot-godaddy \
  certonly \
  --authenticator dns-godaddy \
  --dns-godaddy-credentials /root/.secrets/certbot/godaddy.ini \
  --dns-godaddy-propagation-seconds 120 \
  -d '*.rodgpe.com' -d rodgpe.com