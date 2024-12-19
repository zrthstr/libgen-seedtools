
CONTAINER_NAME = lgst-tests
#IMP = podman ### may need sudo modprobe tun
CONTAINER_BIN = docker
COMPOSE = docker compose


test:
	$(COMPOSE) up -d
	$(CONTAINER_BIN) build -t $(CONTAINER_NAME) .
	$(CONTAINER_BIN) run --rm $(CONTAINER_NAME)
	$(COMPOSE) down


shell:
	$(CONTAINER_BIN) run --rm -it $(CONTAINER_NAME) /bin/bash
