RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :usuario
  end
  config.current_user_method(&:current_usuario)

  config.authorize_with do
    redirect_to main_app.root_path unless current_usuario&.admin?
  end

  config.model 'Assinatura' do
    list do
      field :usuario
      field :status
      field :data_validade
    end

    edit do
      field :status
      field :data_validade
    end
  end
end
