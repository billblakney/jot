FROM ruby:3.2.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y nodejs postgresql-client sqlite3 vim --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle config --global frozen 1
RUN bundle install

COPY . /usr/src/app

RUN bundle exec rake DATABASE_URL=postgresql:does_not_exist assets:precompile
# now that rake is complete, ok to remove production.key
RUN rm -rf /usr/src/app/config/*.key
RUN rm -rf /usr/src/app/config/credentials/*.key

EXPOSE 3000

CMD ./docker-entrypoint.sh
