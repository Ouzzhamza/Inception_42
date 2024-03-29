#!/bin/bash

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]
then
	# create wordpress database
	/etc/init.d/mysql start
	echo "CREATE DATABASE $SQL_DATABASE; GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_USER_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root
	#Set the password for the root user
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');" | mysql -u root
	/etc/init.d/mysql stop
fi

exec "$@"
