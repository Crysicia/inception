FROM	debian:buster

RUN		apt update \
		&& apt-get install -y curl \
							  php7.3-fpm \
							  php7.3-mysql \
							  php7.3-curl \
							  php7.3-gd \
							  php7.3-intl \
							  php7.3-mbstring \
							  php7.3-soap \
							  php7.3-xml \
							  php7.3-xmlrpc \
							  php7.3-zip \
							  mariadb-client

RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

COPY	./config/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY	./config/run.sh .

RUN		chmod +x run.sh \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp \
		&& mkdir -p /var/www/wordpress

RUN		mkdir -p /run/php

EXPOSE	9000

CMD		["./run.sh"]
