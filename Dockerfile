FROM ruby:2.6.5-alpine3.10

ENV RAILS_ENV production

RUN apk --update --no-cache add postgresql-client alpine-sdk postgresql-dev nodejs-current openssl-dev \
  libc6-compat gcompat && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /app
WORKDIR /app
RUN bundle install --deployment --without development test

COPY . .

RUN bundle exec rails assets:precompile

CMD bundle exec rails s
