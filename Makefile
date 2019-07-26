install:
	brew install mkcert
	brew install nss
	brew install dnsmasq
	sudo echo 'address=/local.parallax.dev/127.0.0.1' >> /usr/local/etc/dnsmasq.conf
	sudo mkdir -p /etc/resolver
	echo 'nameserver 127.0.0.1' | sudo tee /etc/resolver/local.parallax.dev
	sudo brew services restart dnsmasq
	mkcert "*.local.parallax.dev" "*.ide.local.parallax.dev"
	mv _wildcard.local.parallax.dev+1.pem ./.certs/local.parallax.dev.crt
	mv _wildcard.local.parallax.dev+1-key.pem ./.certs/local.parallax.dev.key
	docker network create parallax-proxy
	echo "Please restart your computer."

start:
	docker-compose up -d
