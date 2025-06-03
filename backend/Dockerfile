FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  nodejs \
  yarn \
  sqlite3 \
  libsqlite3-dev

WORKDIR /app
COPY . .
RUN bundle install

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
