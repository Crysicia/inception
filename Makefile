LOGIN 		= lpassera
URL			= ${LOGIN}.42.fr
DNS_ENTRY	= "127.0.0.1 ${URL}"
HOSTS_FILE	= "/etc/hosts"


all: setup launch
	@echo ${URL}

dns:
	@grep ${DNS_ENTRY} ${HOSTS_FILE} || echo ${DNS_ENTRY} >> ${HOSTS_FILE}
	@echo "[DNS] - OK"

volumes:
	@mkdir -p /home/${LOGIN}/data
	@echo "[VOLUMES] - OK"

launch:
	@docker-compose --file ./srcs/docker-compose.yml up

setup: dns

.PHONY: all setup dns volumes
