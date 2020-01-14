FROM ruby:2.5.3

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem update --system && gem install bundler -v 2.0.1
RUN bundle install --binstubs

COPY . .

EXPOSE 3000

CMD rails server -b 0.0.0.0