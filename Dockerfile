FROM  php:7.4-apache
RUN docker-php-ext-install pdo_mysql
RUN pecl install xdebug
RUN \
    { \
        echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20190902/xdebug.so'; \
        echo '[xdebug]'; \
        echo 'xdebug.mode=debug'; \
        echo 'xdebug.start_with_request=yes'; \
        echo 'xdebug.client_host=host.docker.internal'; \
        echo 'xdebug.idekey="VSCODE"'; \
#        echo 'xdebug.log=/tmp/xdebug.log'; \
        echo 'xdebug.client_port=9004'; \
    } > /usr/local/etc/php/conf.d/php-xdebug.ini ;