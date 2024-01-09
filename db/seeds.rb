City.destroy_all

default_cities = %w[
  Mumbai
  Delhi
  Bengaluru
  Chennai
  Kolkata
  Hyderabad
  Pune
  Ahmedabad
  Jaipur
  Lucknow
  Kanpur
  Nagpur
  Patna
  Indore
  Thane
  Bhopal
  Visakhapatnam
  Vadodara
  Ghaziabad
  Panaji
]

default_cities.each do |city_name|
  response = OpenWeatherService.new().fetch_city(city_name)

  city_data = response.first

  City.create!(
    name: city_data['name'],
    latitude: city_data['lat'],
    longitude: city_data['lon'],
    country: city_data['country'],
    state: city_data['state']
  )
end
