FROM meuhmeuhconcept/php-fpm

MAINTAINER jn.germon@gmail.com

RUN apk update && \
    apk add \
    openssh \
    curl \
    make \
    git \
    nodejs \
    zsh && \
    rm -rf /var/cache/apk/*

# Install composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

ENV CONTAINER_SHELL /bin/bash

VOLUME /home/developer

RUN touch /var/log/dmesg

ADD entrypoint.sh /

RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["tail", "-f", "/var/log/dmesg"]
