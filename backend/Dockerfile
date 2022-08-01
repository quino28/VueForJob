FROM ruby:3.1.2
RUN apt-get update -qq && \
    apt-get install -y apt-utils \
                       build-essential \
                       libpq-dev \
                       nodejs \
                       default-mysql-server
RUN mkdir /backend
WORKDIR /backend
ADD . /
RUN bundle install -j4

EXPOSE 5000
