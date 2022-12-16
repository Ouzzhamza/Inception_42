#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$SQL_USER/g" wp-config.php
	sed -i "s/password_here/$SQL_PASSWORD/g" wp-config.php
	sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config.php
	cp wp-config-sample.php wp-config.php
fi

exec "$@"
