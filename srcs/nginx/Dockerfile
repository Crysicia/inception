FROM		debian:buster

RUN 		apt-get update				\
			&& apt-get install -y nginx \
				wget					\
			&& wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64 -O mkcert

COPY		./config/nginx.conf /etc/nginx/conf.d

RUN 		chmod 755 mkcert		\
			&& ./mkcert -install	\
			&& ./mkcert -cert-file /etc/ssl/certs/localhost-selfsigned.pem -key-file /etc/ssl/certs/localhost-selfsigned.key localhost

RUN			chmod 755 /var/www/html \
			&& chown -R www-data:www-data /var/www/html

EXPOSE		443

CMD			["nginx", "-g", "daemon off;"]
