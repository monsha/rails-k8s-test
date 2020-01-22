FROM ruby:2.5.3

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs
RUN apt-get update && apt-get install -y postgresql --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem update --system && gem install bundler -v 2.0.1
RUN bundle install --binstubs

COPY . .

RUN bundle exec rails assets:precompile
EXPOSE 3000
CMD rails server -b 0.0.0.0