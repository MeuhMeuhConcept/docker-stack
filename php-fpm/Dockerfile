FROM php:7-fpm-alpine

MAINTAINER jn.germon@gmail.com

RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && \
    apk add \
    php7-curl \
    php7-gd \
    php7-intl \
    php7-mcrypt \
    php7-memcached \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    bash && \
    rm -rf /var/cache/apk/*

# Sanctify (the opposite of daemonize :D ) php-fpm
RUN sed -i -e 's/;daemonize\s*=\s*yes/daemonize = no/g' /usr/local/etc/php-fpm.conf

ADD www.conf /usr/local/etc/php-fpm.d/www.conf
ADD php-fpm.ini /usr/local/etc/php/php.ini

COPY entrypoint.sh /

RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm", "--nodaemonize"]
