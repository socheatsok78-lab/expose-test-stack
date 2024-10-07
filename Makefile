STACK_NAME := expose-test-stack
DOCKER_STACK_FILES := -c ealen/docker-stack.yml -c jmalloc/docker-stack.yml

.EXPORT_ALL_VARIABLES:
-include .env

make:
deploy:
	docker stack deploy $(DOCKER_STACK_FILES) --prune $(STACK_NAME)
remove:
	docker stack rm $(STACK_NAME)

jmalloc/echo-server:
	docker run --rm -p 48081:8080 jmalloc/echo-server
ealen/echo-server:
	docker run --rm -p 48082:80 ealen/echo-server
