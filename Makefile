
CONTAINER_NAME = lgst-tests
#CONTAINER_BIN = podman
CONTAINER_BIN = docker
COMPOSE = docker compose

rm_test_data:
	rm -rf libgen-seedtools-data/data/complete
	rm -rf libgen-seedtools-data/data/incomplete

transmission_up:
	$(COMPOSE) up -d

transmission_down:
	$(COMPOSE) down

test: rm_test_data
	make transmission_up
	rm ./tests/testconfig/config.json || true
	uv run pytest
	make transmission_down
