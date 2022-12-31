#!/bin/bash


if [ ! -f /var/www/wordpress/wp-config.php ]; then
# download wordpress
wp core download --path=/var/www/wordpress --allow-root

# configure wordpress database and redis
wp core config --path=/var/www/wordpress --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_USER_PASSWORD --dbhost=$SQL_HOST --skip-check --allow-root  --extra-php <<PHP
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
PHP

# install wordpress
wp core install --url=$DOMAINE_NAME --title=$TITLE --admin_user=$USERNAME --admin_email=$EMAIL --admin_password=$PASSWORD --path=/var/www/wordpress --allow-root 

#creating a new user
wp user create $WP_USER alexander42@gmail.com --role=author  --user_pass=$WP_PASS --path=/var/www/wordpress  --allow-root 

# installing them
wp theme install zeever --path=/var/www/wordpress  --activate --allow-root

# redis configuration
wp plugin install redis-cache --path=/var/www/wordpress  --activate --allow-root
wp redis update-dropin --path=/var/www/wordpress  --allow-root 
wp redis enable --allow-root

fi

exec "$@"
