FROM ruby:latest

RUN apt-get update \
  && apt-get install -y npm \
  && npm install -g yarn \
  && apt-get install libsqlite3-dev -y \
  && apt-get install ruby-dev -y \
  && apt-get install vim -y \
  && mkdir -p /var/app \
  && useradd -ms /bin/bash railsdev \
  && chown railsdev:railsdev /var/app

EXPOSE 3000

COPY ./Gemfile /var/app

USER railsdev

WORKDIR /var/app

RUN gem update bundler && bundle install

# RUN rails new tutorial

# CMD rails s -b 0.0.0.0 -p 3000
CMD /bin/bash
