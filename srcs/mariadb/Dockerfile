FROM	debian:buster

ARG		MYSQL_DB
ARG		MYSQL_USER
ARG		MYSQL_PASSWORD

RUN		apt-get update \
		&& apt-get install -y mariadb-server

RUN		mkdir -p /var/run/mysqld 				\
		&& chown -R mysql:mysql /var/run/mysqld \
		&& chmod 777 /var/run/mysqld

RUN 	service mysql start 																		\
		&& mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" 	\
		&& mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"										\
		&& mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;" 	\
		&& mysql -e "FLUSH PRIVILEGES;"

EXPOSE	3306

CMD		["mysqld", "--bind-address=0.0.0.0"]
