FROM ruby:latest

ARG USER_ID=1000
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

RUN wget https://go.microsoft.com/fwlink/?LinkID=760868 |
  && sudo apt-get install code*

USER railsdev

WORKDIR /var/app

RUN gem update bundler && bundle install

RUN rails new tutorial

CMD /bin/bash
