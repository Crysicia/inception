FROM		debian:buster

RUN 		apt update \
			&& apt install -y nginx \
			wget \
			&& wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64 -O mkcert

RUN 		chmod 755 mkcert \
			&& ./mkcert -install \
			&& ./mkcert -cert-file /etc/ssl/certs/localhost-selfsigned.pem -key-file /etc/ssl/certs/localhost-selfsigned.key localhost

EXPOSE		80 443

CMD			["nginx", "-g", "daemon off;"]
