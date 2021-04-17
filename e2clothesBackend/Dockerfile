FROM ruby:2.7.2
MAINTAINER Terry Fung <terryyessfung@gmail.com>

RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs

# Clean
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /app/api
WORKDIR /app/api

COPY Gemfile /app/api
COPY Gemfile.lock /app/api

RUN bundle install

COPY . /app/api

RUN ["chmod", "+x", "/app/api/rails_entrypoint.sh"]
ENTRYPOINT ["sh", "/app/api/rails_entrypoint.sh"]
#CMD rails s -b '0.0.0.0'
