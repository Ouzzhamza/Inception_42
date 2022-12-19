FROM debian:buster

RUN apt-get update && apt-get install -y php php-fpm wget

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/adminer.php
    
RUN chmod 644 /var/www/html/adminer.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]
