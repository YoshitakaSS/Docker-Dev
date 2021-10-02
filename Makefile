include .env

up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
install-recommend-packages:
	docker exec php composer require doctrine/dbal
	docker exec php composer require --dev barryvdh/laravel-ide-helper
	docker exec php composer require --dev roave/security-advisories:dev-master
init:
	docker up -d --build
	docker exec php cp .env.local .env
	docker exec php php artisan cache:clear
	docker exec php php artisan key:generate
	docker exec php php artisan storage:link
	docker exec php php artisan migrate:fresh --seed
remake:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes
destroy-volumes:
	docker-compose down --volumes
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
web:
	docker exec nginx ash
php:
	docker exec php bash
php_in:
	docker exec -it php /bin/bash
migrate:
	docker exec php php artisan migrate
fresh:
	docker exec php php artisan migrate:fresh --seed
seed:
	docker exec php php artisan db:seed
rollback-test:
	docker exec php php artisan migrate:fresh
	docker exec php php artisan migrate:refresh
tinker:
	docker exec php php artisan tinker
test:
	docker exec php php artisan test
optimize:
	docker exec php php artisan optimize
optimize-clear:
	docker exec php php artisan optimize:clear
cache:
	docker exec php composer clear-cache
	docker exec php composer dump-autoload -o
	@make optimize
cache-clear:
	@make optimize-clear
db-in:
	docker-compose exec db bash -c 'mysql -u${DB_USER} -p${DB_PASS} ${DB_NAME}'
