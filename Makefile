
CONTAINER_NAME = lgst-tests
#CONTAINER_BIN = podman
CONTAINER_BIN = docker
COMPOSE = docker compose


rm_test_data:
	rm -rf libgen-seedtools-data/data/complete
	rm -rf libgen-seedtools-data/data/incomplete


test: rm_test_data
	$(COMPOSE) up -d
	$(CONTAINER_BIN) build -t $(CONTAINER_NAME) .
	$(CONTAINER_BIN) run --rm $(CONTAINER_NAME)
	$(COMPOSE) down


shell:
	$(CONTAINER_BIN) run --rm -it $(CONTAINER_NAME) /bin/bash
