FROM ruby:2.3.3-slim
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && echo 'Asia/Tokyo' > /etc/timezone && date
RUN apt-get update -qq && \
    apt-get install -y software-properties-common git-core build-essential autoconf curl \
      ruby ruby-dev zlib1g-dev libmysqlclient-dev imagemagick libmagickcore-dev libmagickwand-dev nodejs locales

RUN mkdir /myapp
WORKDIR /myapp

ENV LANG C.UTF-8

ADD ./src/Gemfile /myapp/Gemfile
ADD ./src/Gemfile.lock /myapp/Gemfile.lock

ADD ./src/api/Gemfile /myapp/api/Gemfile
ADD ./src/api/Gemfile.lock /myapp/api/Gemfile.lock

ADD ./src/admin/Gemfile /myapp/admin/Gemfile
ADD ./src/admin/Gemfile.lock /myapp/admin/Gemfile.lock

ADD ./src/recop/Gemfile /myapp/recop/Gemfile
ADD ./src/recop/Gemfile.lock /myapp/recop/Gemfile.lock

ADD ./web/docker-bootstrap /usr/local/bin/docker-bootstrap

RUN bundle install
