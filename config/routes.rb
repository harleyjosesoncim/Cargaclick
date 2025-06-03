<<<<<<< HEAD
Rails.application.routes.draw do
  root 'application#index'
end
=======
Rails.application.routes.draw do
  root "home#index"
end

get "/transportadores/filtros", to: "transportadores#filtros"
post "/transportadores/buscar", to: "transportadores#buscar"
>>>>>>> bd08dc42873a39f711f72b80364c044d57f9016b
