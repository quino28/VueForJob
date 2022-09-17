FROM ruby:3.1.2
RUN apt-get update -qq && \
    apt-get install -y nodejs \
                       default-mysql-server

WORKDIR /backend
COPY ./backend /backend
RUN bundle install -j4

EXPOSE 5000
