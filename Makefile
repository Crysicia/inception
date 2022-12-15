LOGIN 		= lpassera
URL			= ${LOGIN}.42.fr
DNS_ENTRY	= "127.0.0.1 ${URL}"
HOSTS_FILE	= "/etc/hosts"


all: launch
	@echo ${URL}

dns:
	-@grep ${DNS_ENTRY} ${HOSTS_FILE} || echo ${DNS_ENTRY} >> ${HOSTS_FILE}
	@echo "[DNS] - OK"

volumes:
	@mkdir -p /home/${LOGIN}/data/db_data
	@mkdir -p /home/${LOGIN}/data/wp_data
	@echo "[VOLUMES] - OK"

launch:
	@docker-compose --file ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose --file ./srcs/docker-compose.yml down

stop:
	-@docker stop $(shell docker ps -aq)

clean_containers:
	-@docker rm -f $(shell docker ps -aq)

clean_images:
	-@docker rmi -f $(shell docker images -aq)

clean_volumes:
	-@docker volume rm $(shell docker volume ls -q)

fclean: stop clean_containers clean_images clean_volumes

setup: volumes

.PHONY: all setup dns volumes launch down stop clean_containers clean_images clean_volumes
