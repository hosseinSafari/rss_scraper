FROM ruby:3.0.0
#MAINTAINER ''

RUN apt-get update\
&& apt-get install -y sudo


ENV INSTALL_PATH /usr/src/rss_scraper/
#ENV SECRET_KEY_BASE="3e39f3133eaced5fd3f5d4c27083549da91a67826837957a82ca32ae7efaaf98669431341ed1ba6c18ea44ecbbc3ce4ca5623518af615fc4d4ee75d2d025c171"
RUN mkdir -p $INSTALL_PATH


RUN apt-get update
RUN apt-get install -y curl bash


ENV EXPOSE_PORT="3000"
EXPOSE $EXPOSE_PORT
ENV RAILS_ENV=production
VOLUME [ "/public/uploads" ]

RUN /bin/bash -l -c "gem install bundler"

ADD internal_libraries/peafowl-0.1.1 $INSTALL_PATH./internal_libraries/peafowl-0.1.1
ADD Gemfile $INSTALL_PATH
#ADD Gemfile.lock $INSTALL_PATH

WORKDIR $INSTALL_PATH
RUN bundle config set --local without 'development test'
RUN bundle install

ADD . $INSTALL_PATH
RUN sudo mkdir -p log


RUN sudo mkdir -p tmp/pids
RUN sudo mkdir -p tmp/sockets
RUN sudo mkdir -p tmp/cache

RUN chmod -R 777 $INSTALL_PATH
CMD bin/rails server -b 0.0.0.0 -p 3000