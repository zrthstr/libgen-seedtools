
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
	$(COMPOSE) down && true

test: rm_test_data
	echo "DEBUG: pwd -"
	pwd
	make transmission_up
	rm ./tests/testconfig/config.json || true
	uv build
	uv run pytest
	make transmission_down


install_from_testing:
	pip install -i https://test.pypi.org/simple/  --extra-index-url https://pypi.org/simple   libgen-seedtools==0.5.5
