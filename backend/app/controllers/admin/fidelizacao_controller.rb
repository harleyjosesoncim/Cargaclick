class Admin::FidelizacaoController < ApplicationController
  def index
    @transportadors = Transportador.all
  end
end
