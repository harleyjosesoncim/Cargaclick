class Admin::DashboardController < ApplicationController
  before_action :requer_admin

  def index
  end

  private

  def requer_admin
    user = User.find_by(email: 'admin@cargolink.com') # substitua por lógica real se quiser
    unless user&.admin?
      render plain: "Acesso negado", status: :unauthorized
    end
  end
end