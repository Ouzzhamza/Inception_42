
FROM debian:buster

RUN apt-get update && apt-get -y install php php-fpm php-mysql wget  

RUN mkdir /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress.sh

WORKDIR /var/www/html/
ENTRYPOINT [ "/var/www/wordpress.sh" ]


EXPOSE 9000

CMD ["php-fpm7.3", "-F"]
