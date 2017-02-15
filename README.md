# How to use.

``` sh
# Clone sources into ./src dir.
git clone git@github.com:rista-inc/joblist.git src

# Build images.
docker-compose build

# Run services.
docker-compose up

# Initialize database and elasticsearch.
docker-compose run web bin/rake joblist:db:reset

# Run any command.
docker-compose run web bin/rake db:migrate
docker-compose run web bin/rails c
```

# Todo

* After updating the Gemfile you have to rebuild. It is should be run `bundle install` when `docker-compose up`.

