require 'httparty'

class OpenWeatherService
  include HTTParty
  base_uri 'http://api.openweathermap.org/'

  def initialize(options = {})
    city = options[:city]

    @options = {
      query: {
        appid: ENV['AIR_POLLUTION_API_KEY'],
        lat: city&.latitude,
        lon: city&.longitude
      }
    }
  end

  def fetch_city(city_name)
    get("/geo/1.0/direct?q=#{city_name}", @options)
  end

  def current_pollution
    get("/data/2.5/air_pollution", @options)
  end

  def forecast_pollution
    get("/data/2.5/air_pollution/forecast", @options)
  end

  def historical_pollution(start_date, end_date)
    query_params = {
      start: start_date,
      end: end_date
    }
    @options[:query].merge!(query_params)
    get("/data/2.5/air_pollution/history", @options)
  end

  private

  def get(endpoint, options)
    self.class.get(endpoint, options)
  end
end
