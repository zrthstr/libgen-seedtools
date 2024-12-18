
CONTAINER = lgst-tests

test:
	# Build the Docker image
	docker build -t $(lgts-tests) .
# Run the container and execute the tests
	docker run --rm $(lgts-tests)


shell:
	docker run -it $(lgts-tests) /bin/bash
