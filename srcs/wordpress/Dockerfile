FROM	debian:buster

ARG user=user42
ARG password=user42
ARG database=wordpress

RUN		apt update \
		&& apt-get install -y wget \
							  php7.3-fpm \
							  php7.3-mysql \
							  php7.3-curl \
							  php7.3-gd \
							  php7.3-intl \
							  php7.3-mbstring \
							  php7.3-soap \
							  php7.3-xml \
							  php7.3-xmlrpc \
							  php7.3-zip

COPY	./config/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY	wp-cli.phar .
COPY	wordpress.tar.gz .

RUN		tar xvzf wordpress.tar.gz \
		&& rm wordpress.tar.gz \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp
		# && wp config create --path=/var/www/localhost --dbname=$database --dbuser=$user --dbpass=$password --allow-root \
		# && wp core install --path=/var/www/localhost --url=localhost --title="lpassera's ft_server" --admin_user=admin --admin_password=admin --admin_email=admin@localhost.com --allow-root

RUN		mkdir -p /run/php

EXPOSE	9000

CMD		["/usr/sbin/php-fpm7.3", "-F", "-R"]
