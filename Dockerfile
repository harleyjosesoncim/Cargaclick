FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev nodejs

WORKDIR /app
COPY . .

RUN bundle install

EXPOSE 8080
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "8080"]
