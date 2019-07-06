start:
	docker-compose up -d

install:
	make start
	docker-compose exec -T app php artisan key:generate
	docker-compose exec -T app composer global require hirak/prestissimo
	docker-compose exec -T app composer install
	docker-compose exec -T app php artisan migrate --seed
	make node

node:
	docker run --rm -t -v $(PWD):/app node:8 npm i --prefix /app
	docker run --rm -t -v $(PWD):/app driebit/node-gulp gulp build --prefix /app

ssh:
	docker-compose exec app bash
