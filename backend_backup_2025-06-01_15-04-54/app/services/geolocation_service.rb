require 'net/http'
require 'json'

class GeolocationService
  NOMINATIM_URL = "https://nominatim.openstreetmap.org/search"
  USER_AGENT = "CargoLinkApp"

  def self.cep_to_coordinates(cep)
    uri = URI(NOMINATIM_URL)
    uri.query = URI.encode_www_form(q: cep, format: 'json', limit: 1)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      req = Net::HTTP::Get.new(uri)
      req['User-Agent'] = USER_AGENT
      http.request(req)
    end

    data = JSON.parse(response.body)
    return nil if data.empty?
    [data[0]['lon'].to_f, data[0]['lat'].to_f] # ordem: longitude, latitude
  end
end
