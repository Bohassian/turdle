FROM ruby:3.1.1
RUN apt-get update -qq && apt-get install -y postgresql-client yarn
WORKDIR /turdle
COPY . /turdle
RUN bundle install
RUN ln -s /turdle/.rubocop.yml /root/.rubocop.yml
