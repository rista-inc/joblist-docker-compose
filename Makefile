default: up

up:
	rm -rf ./src/tmp/pids/*
	docker-compose up &
	foreman start -d ./src -f ./Procfile
