Rails.application.routes.draw do
  root 'application#index'
  get "/transportadores/filtros", to: "transportadores#filtros"
  post "/transportadores/buscar", to: "transportadores#buscar"
  # Adicione aqui outras rotas necessárias, como recursos de clientes, fretes, etc.
end
=======
=======
Rails.application.routes.draw do
  root "home#index"
end


