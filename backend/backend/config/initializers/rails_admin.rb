
RailsAdmin.config do |config|
  config.asset_source = :sprockets
  config.main_app_name = ["CargoLink", "Admin"]
  config.authenticate_with do
    # Devise authentication can go here if desired
    # Example: warden.authenticate! scope: :usuario
  end
  config.current_user_method(&:current_usuario)
end
