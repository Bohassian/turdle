FROM ruby:3.1.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install solargraph
WORKDIR /turdle
COPY . /turdle
