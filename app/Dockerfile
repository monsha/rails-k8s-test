FROM ruby:2.6.5-alpine3.10

ENV RAILS_ENV production

RUN apt-get update && apt-get install -y sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /app
WORKDIR /app
EXPOSE 3000

COPY Gemfile /app
RUN gem update --system && gem install bundler -v 2.0.1

RUN bundle install 
COPY . /app
RUN bundle exec rails assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
