module Clientes
  class DashboardController < ApplicationController
    before_action :authenticate_cliente!
    layout 'cliente'

    def index
    end
  end
end
