default: up

init:
	docker-compose build
	docker-compose run --rm web bin/setup

up:
	rm -rf src/tmp/pids/*
	docker-compose up

c:
	docker-compose run --rm web rails c

reset:
	docker-compose run --rm web rails joblist:db:reset
