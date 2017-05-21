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

### `bundle install` failed.

``` sh
Step 16/18 : RUN bundle install
 ---> Running in dd14930625c6
Fetching gem metadata from https://rubygems.org/........
Fetching version metadata from https://rubygems.org/..
Fetching dependency metadata from https://rubygems.org/.
Could not find gem 'admin' in source at `admin`.
Source does not contain any versions of 'admin'
```

Rewrite gemfile only when executing `docker-compose build`.

``` rb
gem 'admin', "0.0.1", path: 'admin'
gem 'recop', "0.0.1", path: 'recop'
gem "api", "0.0.1", path: "api"
```

### `rails c` failed.

``` sh
rm src/tmp/pid/*
```

