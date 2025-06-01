require 'net/http'
require 'json'

class RouteService
  ORS_URL = "https://api.openrouteservice.org/v2/directions/driving-car"
  API_KEY = ENV['ORS_API_KEY']

  def self.get_distance_km(start_coords, end_coords)
    return nil if API_KEY.nil?
    uri = URI(ORS_URL)
    uri.query = URI.encode_www_form(start: start_coords.join(','), end: end_coords.join(','))

    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = API_KEY
    request["Content-Type"] = "application/json"

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    data = JSON.parse(response.body)
    distance_m = data.dig("features", 0, "properties", "segments", 0, "distance")
    (distance_m / 1000.0).round(2) if distance_m
  rescue
    nil
  end
end
