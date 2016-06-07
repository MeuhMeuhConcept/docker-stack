#!/bin/bash
set -e

if [ "$USERNAME" -a ! "$(id "$USERNAME")" ]; then

    if [ -z "$UNIX_UID" ]; then
        UNIX_UID=1000
    fi

    # Create user
    adduser -u "$UNIX_UID" "$USERNAME" -D

    # Replace www-data by $USERNAME
    sed --in-place --expression="s/www-data/$USERNAME/g" /usr/local/etc/php-fpm.d/www.conf

fi

exec "$@"
