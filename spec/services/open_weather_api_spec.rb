require 'rails_helper'

RSpec.describe OpenWeatherApi, type: :service do
  describe '.fetch_city' do
    it 'fetches city data from OpenWeatherMap' do
      VCR.use_cassette('open_weather_api/fetch_city') do
        response = OpenWeatherApi.new().fetch_city('Pune')

        expect(response.code).to eq(200)
      end
    end
  end
end
