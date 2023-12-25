require 'httparty'

class OpenWeatherApi
  include HTTParty
  base_uri 'http://api.openweathermap.org/'

  def initialize()
    @options = { query: { appid: ENV['AIR_POLLUTION_API_KEY'] } }
  end

  def fetch_city(city)
    self.class.get("/geo/1.0/direct?q=#{city}", @options)
  end
end
