php artisan key:generate
php artisan vendor:publish --provider="Barryvdh\Debugbar\ServiceProvider"

chmod -R 777 /var/www/dev-web/bootstrap/cache
chmod -R 777 /var/www/dev-web/storage