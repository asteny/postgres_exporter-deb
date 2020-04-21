VERSION = 0.8.0
ITERATION = 0
UID ?= 0

all: build

build: download
	chmod -Rv 644 build/contrib/
	fpm -s dir -f -t deb \
		-n postgres_exporter \
		-v $(VERSION) \
		--iteration $(ITERATION) \
		--after-install build/contrib/postgres_exporter.postinstall \
		--after-remove build/contrib/postgres_exporter.postrm \
		-p build/packages \
		build/contrib/postgres_exporter.service=/lib/systemd/system/postgres_exporter.service \
		build/contrib/postgres_exporter.defaults=/etc/default/postgres_exporter \
		build/contrib/postgres_exporter.preset=/usr/lib/systemd/system-preset/postgres_exporter.preset \
        /tmp/postgres_exporter/postgres_exporter=/usr/bin/postgres_exporter

download:
	cd /tmp && curl -Lo postgres_exporter.tar.gz https://github.com/wrouesnel/postgres_exporter/releases/download/v$(VERSION)/postgres_exporter_v$(VERSION)_linux-amd64.tar.gz
	cd /tmp && tar -xvzf /tmp/postgres_exporter.tar.gz && mv postgres_exporter-v$(VERSION).linux-amd64 postgres_exporter
	chmod +x postgres_exporter/postgres_exporter
