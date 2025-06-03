require 'rest-client'

EFI_API_KEY = ENV['EFI_API_KEY'] || ''

class EfiBankClient
  API_BASE = 'https://api.efibank.com/v1'

  def self.create_charge(amount_cents:, description:, callback_url:)
    RestClient.post "#{API_BASE}/charges",
      { amount: amount_cents, description: description, callback_url: callback_url }.to_json,
      { Authorization: "Bearer #{EFI_API_KEY}", content_type: :json, accept: :json }
  end
end
