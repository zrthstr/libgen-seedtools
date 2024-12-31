CONTAINER_NAME = lgst-tests
#CONTAINER_BIN = podman
CONTAINER_BIN = docker
COMPOSE = docker compose
VERSION=$(shell cat pyproject.toml|  grep version | sed 's/version = //g')

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


test_pypi_testing: install_from_testing
	libgen-seedtools --version
	## tbd: check that theversion is the newest..

install_from_testing:
	echo VERSION=$(VERSION)
	pip install -i https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple libgen-seedtools==$(VERSION)
