FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /firehelp-api
WORKDIR /firehelp-api
COPY Gemfile /firehelp/Gemfile-api
COPY Gemfile.lock /firehelp/Gemfile.lock-api
RUN bundle install
COPY . /firehelp-api
RUN sh bin/asset_check
