FROM php:7-fpm-alpine

MAINTAINER jn.germon@gmail.com

RUN apk update && \
    apk add \
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
