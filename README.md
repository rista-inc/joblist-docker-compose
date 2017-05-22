## How to use.

``` sh
# Clone sources into ./src dir.
git clone git@github.com:rista-inc/joblist.git src

# Build images.
docker-compose build

# Run services.
docker-compose up

# Initialize database and elasticsearch.
docker-compose run --rm web bin/rake joblist:db:reset

# Connect to Redis.
docker-compose run --rm web bash
redis-cli -h redis
```

## Run any command.

```
docker-compose run --rm web bin/rake db:migrate
docker-compose run --rm web bin/rails c
```

## If you have trouble.

### `rails s` failed.

``` sh
rm src/tmp/pid/*
```

