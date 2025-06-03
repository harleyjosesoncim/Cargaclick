FROM ruby:3.2
<<<<<<< HEAD
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  sqlite3 \
  libsqlite3-dev
WORKDIR /app
COPY . .
RUN bundle install
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
=======
WORKDIR /app
COPY . .
RUN bundle install
CMD ["rails", "server", "-b", "0.0.0.0"]
>>>>>>> 6fe9caa1aa84837fbb7bcc8ed0afb712c6086dcc
