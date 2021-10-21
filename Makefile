LOGIN 		= lpassera
URL			= ${LOGIN}.42.fr
DNS_ENTRY	= "127.0.0.1 ${URL}"
HOSTS_FILE	= "/etc/hosts"


all:
	@echo ${URL}

dns:
	@grep ${DNS_ENTRY} ${HOSTS_FILE} || echo ${DNS_ENTRY} >> ${HOSTS_FILE}
	@echo "[DNS] - OK"

volumes:
	@mkdir -p /home/${LOGIN}/data
	@echo "[VOLUMES] - OK"

setup: dns volumes

.PHONY: all setup dns volumes
