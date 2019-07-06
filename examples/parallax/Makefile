start:
	docker-compose up -d

install:
	make start
	docker-compose exec -d app "composer global require hirak/prestissimo && composer install"
	docker-compose exec -d app php artisan key:generate
	docker-compose exec -d app php artisan migrate --seed
	make install node

node:
	docker run --rm -t -v $(PWD):/app node:8 /bin/bash -c "cd /app && npm i && npm i -g gulp-cli && gulp build"

ssh:
	docker-compose exec app bash
