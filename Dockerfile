FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /thomas-fire-help
WORKDIR /thomas-fire-help
COPY Gemfile /thomas-fire-help/Gemfile
COPY Gemfile.lock /thomas-fire-help/Gemfile.lock
RUN bundle install
COPY . /thomas-fire-help
