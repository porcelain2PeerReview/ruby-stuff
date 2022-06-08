ARG USER_ID=1000

FROM ruby:latest

ENV USER_ID=$USER_ID

RUN useradd -u $USER_ID -ms /bin/bash railsdev

RUN apt-get update && apt-get upgrade -y \
 && apt-get install -y npm \
 && npm install -g yarn \
 && apt-get install libsqlite3-dev -y \
 && apt-get install ruby-dev -y \
 && apt-get install vim -y \
 && mkdir -p /var/app \
 && chown railsdev:railsdev /var/app

EXPOSE 3000

COPY ./Gemfile /var/app

USER railsdev

WORKDIR /var/app

RUN gem update bundler && bundle install

CMD /bin/bash
