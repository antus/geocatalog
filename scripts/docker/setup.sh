#!/bin/bash
echo "Start Setup"
# Bash "strict mode"
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

# Aggiorna i repository a quelli dell’archivio Debian (Buster è EOL)
cat > /etc/apt/sources.list <<EOF
deb http://archive.debian.org/debian buster main contrib non-free
deb http://archive.debian.org/debian-security buster/updates main contrib non-free
deb http://archive.debian.org/debian buster-updates main contrib non-free
EOF

# Disabilita la verifica "Valid-Until" (necessaria con archive.debian.org)
apt-get -o Acquire::Check-Valid-Until=false update

# Aggiorna pacchetti
apt-get update

apt-get -y upgrade

# Installa wget e gnupg
apt-get install -y wget gnupg

# Abilita postgresql-client-13 (usa bullseye-pgdg invece di buster-pgdg)
echo "deb http://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Per GDAL 3.2.1 (rimane bullseye solo per questo pacchetto)
echo "deb http://deb.debian.org/debian bullseye main contrib non-free" | tee /etc/apt/sources.list.d/debian-bullseye.list

# Installa librerie di base (aggiunto gdal-bin per gdal-config)
apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y \
    libgdal-dev gdal-bin libpq-dev libxml2-dev \
    libxml2 libxslt1-dev zlib1g-dev libjpeg-dev \
    libmemcached-dev libldap2-dev libsasl2-dev libffi-dev


apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y \
    gcc zip gettext geoip-bin cron \
    postgresql-client-13 \
    sqlite3 spatialite-bin libsqlite3-mod-spatialite \
    python3-dev python3-gdal python3-psycopg2 python3-ldap \
    python3-pip python3-pil python3-lxml python3-pylibmc \
    uwsgi uwsgi-plugin-python3 \
    firefox-esr \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*


# Prepara dipendenze aggiuntive
apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y \
    devscripts build-essential debhelper pkg-kde-tools sharutils

apt-get -o Acquire::Check-Valid-Until=false install -y libffi7 || true

# Install pip packages
pip install --upgrade pip
pip install "pip<24.1"
pip install "pygdal==$(gdal-config --version).*" flower==0.9.4

# Attiva memcached
apt-get install -y memcached
pip install pylibmc sherlock

# Crea cartelle richieste
mkdir -p ${APP_DIR}

# Installa cartoview (installa anche GeoNode come dipendenza)
cd ${APP_DIR}/cartoview && pip install -e .

# Cleanup immagine
rm -rf ~/.cache/pip /root/.cache
apt autoremove --purge -y && apt autoclean -y && apt-get clean -y
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
echo "Create link to libffi.so.6"
ln -s /usr/lib/x86_64-linux-gnu/libffi.so.7 /usr/lib/x86_64-linux-gnu/libffi.so.6
pip install pyOpenSSL==22.0.0  cryptography==35.0.0

echo "Yes, do as I say!" | apt-get remove --force-yes login && \
    dpkg --remove --force-depends wget
