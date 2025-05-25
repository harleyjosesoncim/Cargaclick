class AdminAuthController < ApplicationController
  def login
    admin = Admin.find_by(email: params[:email])
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      render json: { success: true, message: "Login realizado com sucesso." }
    else
      render json: { success: false, message: "Credenciais inválidas." }, status: :unauthorized
    end
  end

  def logout
    session[:admin_id] = nil
    render json: { success: true, message: "Logout realizado com sucesso." }
  end
end
