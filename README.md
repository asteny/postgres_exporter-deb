[![Build Status](https://travis-ci.org/asteny/postgres_exporter-deb.svg?branch=master)](https://travis-ci.org/asteny/postgres_exporter-deb)[![Download](https://api.bintray.com/packages/asten/prometheus/postgres_exporter/images/download.svg)](https://bintray.com/asten/prometheus/postgres_exporter/_latestVersion)


Postgres_exporter deb
==========

Deb package with [postgres_exporter](https://github.com/wrouesnel/postgres_exporter) for Ubuntu (16.04 - 18.04)

Installation
------------
```bash
apt-get update
apt-get install gnupg2 apt-transport-https ca-certificates -y
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
echo "deb https://dl.bintray.com/asten/prometheus xenial main" | tee -a /etc/apt/sources.list.d/prometheus.list
apt-get update
apt-get install postgres-exporter -y

```

[All package versions in Bintray repo](https://bintray.com/asten/prometheus/postgres_exporter)
-------------------------------------------------------------------------------
