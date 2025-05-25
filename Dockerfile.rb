FROM ruby:3.4.3

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos
COPY . .

# Instala as gems
RUN gem install bundler && bundle install

# Expõe a porta do servidor Rails
EXPOSE 3000

# Comando padrão
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
