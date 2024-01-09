require 'rails_helper'

RSpec.describe OpenWeatherService, type: :service do
  describe '#fetch_city' do
    it 'fetches city data from OpenWeatherMap API', :vcr do
      VCR.use_cassette('openweatherservice/fetch_city') do
        api = OpenWeatherService.new
        response = api.fetch_city('Delhi')

        expect(response.code).to eq(200)
      end
    end
  end

  describe '#current_pollution' do
    it 'fetches current pollution data from OpenWeatherMap API', :vcr do
      VCR.use_cassette('openweatherservice/current_pollution') do
        city = City.find_or_initialize_by_name(name: 'Delhi')
        api = OpenWeatherService.new({city: city})
        response = api.current_pollution

        expect(response.code).to eq(200)
      end
    end
  end

  describe '#forecast_pollution' do
    it 'fetches forecast pollution data from OpenWeatherMap API', :vcr do
      VCR.use_cassette('openweatherservice/forecast_pollution') do
        city = City.find_or_initialize_by_name(name: 'Delhi')
        api = OpenWeatherService.new({city: city})
        response = api.forecast_pollution

        expect(response.code).to eq(200)
      end
    end
  end

  describe '#historical_pollution' do
    it 'fetches historical pollution data from OpenWeatherMap API', :vcr do
      VCR.use_cassette('openweatherservice/historical_pollution') do
        city = City.find_or_initialize_by_name(name: 'Delhi')
        start_time = DateTime.parse('2022-01-01').to_time.to_i
        end_time = DateTime.parse('2022-12-31').to_time.to_i
        api = OpenWeatherService.new({city: city})
        response = api.historical_pollution(start_time, end_time)

        expect(response.code).to eq(200)
      end
    end
  end
end
