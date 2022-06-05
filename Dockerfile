FROM ruby:latest

RUN apt-get update \
  && apt-get install -y npm \
  && npm install -g yarn \
  && apt-get install libsqlite3-dev -y \
  && apt install ruby-dev -y \
  && mkdir -p /var/appi \
  && mkdir -p ~/.ssh

WORKDIR /var/app
COPY ./Gemfile /var/app

RUN gem update bundler && bundle install

EXPOSE 3000

# RUN rails new tutorial

WORKDIR /var/app

# CMD rails s -b 0.0.0.0 -p 3000
CMD /bin/bash
