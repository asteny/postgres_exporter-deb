all: build

build: compress
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

compress: download
	upx /tmp/postgres_exporter/postgres_exporter

download:
	cd /tmp && curl -Lo postgres_exporter.tar.gz https://github.com/prometheus-community/postgres_exporter/releases/download/v$(VERSION)/postgres_exporter-$(VERSION).linux-amd64.tar.gz
	cd /tmp && tar -xvzf /tmp/postgres_exporter.tar.gz && mv postgres_exporter-$(VERSION).linux-amd64 postgres_exporter
	cd /tmp && chmod +x postgres_exporter/postgres_exporter
