Rails.application.routes.draw do
  root 'application#index'
  get "/transportadores/filtros", to: "transportadores#filtros"
  post "/transportadores/buscar", to: "transportadores#buscar"
  # Adicione aqui outras rotas necessárias, como recursos de clientes, fretes, etc.
end
<<<<<<< HEAD
=======
=======
Rails.application.routes.draw do
  root "home#index"
end
>>>>>>> e46af4d9efb31cd23871385e6e1730c36e81eb41

