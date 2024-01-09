class City < ApplicationRecord
  has_many :pollution_data, dependent: :destroy

  def self.find_or_initialize_by_name(name:)
    city = City.find_by(name: name.capitalize)

    return city if city.present?

    response = fetch_city_data(name)
    build_city_from_response(response) if response.present?
  end

  def self.fetch_city_data(name)
    OpenWeatherService.new.fetch_city(name)
  end

  def self.build_city_from_response(response)
    city_data = response[0]

    City.new(
      name: city_data['name'],
      latitude: city_data['lat'],
      longitude: city_data['lon'],
      country: city_data['country'],
      state: city_data['state']
    )
  end
end
