
FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get -y install php php-fpm php-mysql wget curl php-redis sendmail

RUN mkdir /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools /var/www/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN chmod +x /var/www/wordpress.sh

WORKDIR /var/www/wordpress/

ENTRYPOINT [ "/var/www/wordpress.sh" ]

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]
