# config/puma.rb
port ENV.fetch("PORT") { 8080 }