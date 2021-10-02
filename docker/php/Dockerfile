FROM php:8.0-fpm-buster

# latest
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
    apt-get -y install git libicu-dev libonig-dev libzip-dev unzip locales libfontconfig1 libfontconfig1 libxrender-dev fonts-ipafont libxext-dev && \
    apt-get clean && \
    pecl install xdebug && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/run/php-fpm && \
    docker-php-ext-install intl pdo_mysql zip bcmath && \
    docker-php-ext-enable xdebug && \
    composer config -g process-timeout 3600 && \
    composer config -g repos.packagist composer https://packagist.org

COPY ./docker/php/php-fpm.d/php-fpm.conf /usr/local/etc/php-fpm.d/zzz-www.conf
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

EXPOSE 9000
WORKDIR /var/www/
