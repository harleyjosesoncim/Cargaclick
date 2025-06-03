Rails.application.configure do
  # Outras configurações...

  # Permitir acesso via localhost, 127.0.0.1 ou ngrok/tunelamento
  config.hosts << "localhost"
  config.hosts << "127.0.0.1"
  config.hosts << "seu-dominio.ngrok.io"  # substitua se necessário

  # Alternativa: permitir todos os hosts (somente para DEV)
  # config.hosts.clear

  # Outras configurações existentes...
end
