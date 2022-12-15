#!/bin/sh

if [ -f /var/www/wordpress/wp-config.php ]
then
	echo "[run.sh] Wordpress already downloaded"
else
	cd /var/www/wordpress
	wp core download --allow-root
	wp config create --dbhost=mariadb:3306 --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root
	wp core install --url=lpassera.42.fr --title="lpassera's ft_server" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --user_pass=$WORDPRESS_PASSWORD --allow-root
	chown -R www-data:www-data /var/www/wordpress
fi

exec "$@"
