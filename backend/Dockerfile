FROM ruby:3.2

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  sqlite3 \
  libsqlite3-dev

# Define diretório padrão da aplicação
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala gems
RUN bundle install

# Expõe a porta usada pela aplicação
EXPOSE 3000

# Comando para iniciar o servidor Rails
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
