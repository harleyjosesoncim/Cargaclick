FROM ruby:3.2

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Cria diretório da aplicação
WORKDIR /app

# Copia os arquivos do projeto
COPY . /app

# Instala gems
RUN gem install bundler && bundle install

# Expõe a porta padrão do Rails
EXPOSE 3000

# Comando de inicialização (igual ao Procfile)
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
