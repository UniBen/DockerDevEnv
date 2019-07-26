#!make
SHELL := /bin/bash

include .env
export $(shell sed 's/=.*//' .env)

install:
	brew install mkcert
	brew install nss
	brew install dnsmasq
	sudo echo 'address=/$(PROXY_DOMAIN)/127.0.0.1' >> /usr/local/etc/dnsmasq.conf
	sudo mkdir -p /etc/resolver
	echo 'nameserver 127.0.0.1' | sudo tee /etc/resolver/$(PROXY_DOMAIN)
	sudo brew services restart dnsmasq
	mkcert "*.$(PROXY_DOMAIN)" "*.ide.$(PROXY_DOMAIN)"
	mv _wildcard.$(PROXY_DOMAIN)+1.pem ./.certs/$(PROXY_DOMAIN).crt
	mv _wildcard.$(PROXY_DOMAIN)+1-key.pem ./.certs/$(PROXY_DOMAIN).key
	docker network create parallax-proxy
	echo "Please restart your computer."

start:
	docker-compose up -d
