FROM php:7-fpm

MAINTAINER Andre Luiz <andreluizs@live.com>

# update image
RUN apt-get update

RUN apt-get install -y git zip

# composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer

# localtime
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# mysql
RUN docker-php-ext-install pdo pdo_mysql opcache

# npm
RUN apt-get install -y -qq npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# bower
RUN npm install --global bower

WORKDIR /usr/share/nginx/html/



