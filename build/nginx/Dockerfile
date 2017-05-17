FROM nginx

MAINTAINER Andre Luiz <andreluizs@live.com>

# update image
RUN apt-get update

# localtime
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# nginx conf
COPY build/nginx/nginx.conf /etc/nginx/nginx.conf
COPY build/nginx/site.conf /etc/nginx/conf.d/site.conf

RUN usermod -u 1000 www-data

WORKDIR /usr/share/nginx/html/

