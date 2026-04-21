FROM certbot/certbot:v5.5.0

RUN apk add --no-cache git

WORKDIR /opt

RUN git clone https://github.com/miigotu/certbot-dns-godaddy.git \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir /opt/certbot-dns-godaddy



#FROM ubuntu:24.04
#
#ENV DEBIAN_FRONTEND=noninteractive
#ENV VIRTUAL_ENV=/opt/certbot
#ENV PATH="/opt/certbot/bin:$PATH"
#
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    python3 \
#    python3-venv \
#    ca-certificates \
#    curl \
#    && rm -rf /var/lib/apt/lists/*
#
## Create isolated venv so certbot/plugin versions are controlled
#RUN python3 -m venv /opt/certbot \
#    && /opt/certbot/bin/pip install --no-cache-dir --upgrade pip setuptools wheel \
#    && /opt/certbot/bin/pip install --no-cache-dir \
#       certbot==5.5.0 \
#       certbot-dns-godaddy==2.8.0
#
## Optional place for secrets
#RUN mkdir -p /root/.secrets/certbot \
#    && chmod 700 /root/.secrets/certbot
#
#CMD ["certbot", "--version"]