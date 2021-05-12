FROM		debian:buster

RUN 		apt update \
			&& apt install -y nginx

EXPOSE		80

ENTRYPOINT 	service nginx start \
		   	&& /bin/bash
