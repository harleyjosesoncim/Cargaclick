module Clientes
  class FaturasController < ApplicationController
    before_action :authenticate_cliente!

    def index
      @fretes = Frete.where(cliente_id: current_cliente.id)

      if params[:inicio].present?
        @fretes = @fretes.where("created_at >= ?", Date.parse(params[:inicio]))
      end

      if params[:fim].present?
        @fretes = @fretes.where("created_at <= ?", Date.parse(params[:fim]).end_of_day)
      end

      if params[:status].present?
        @fretes = @fretes.where(status_pagamento: params[:status])
      end
    end
  end
end
