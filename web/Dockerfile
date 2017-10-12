FROM ruby:2.4.1-slim
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && echo 'Asia/Tokyo' > /etc/timezone && date
RUN apt-get update -qq && \
    apt-get install -y software-properties-common git-core build-essential autoconf curl \
      ruby ruby-dev zlib1g-dev mysql-client libmysqlclient-dev imagemagick libmagickcore-dev libmagickwand-dev locales wget redis-tools

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
ADD ./web/Procfile /usr/local/bin/Procfile

RUN bundle install

RUN apt-get install -y apt-transport-https
RUN apt-get update -qq

RUN curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo "deb https://deb.nodesource.com/node_6.x xenial main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update -qq && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

ENV PHANTOMJS_VERSION 2.1.1
RUN cd /tmp && \
    wget -q https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
    tar jxf phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
    mv phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -rf phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 phantomjs-$PHANTOMJS_VERSION-linux-x86_64

RUN gem install foreman
