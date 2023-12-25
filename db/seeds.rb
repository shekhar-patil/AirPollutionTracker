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

default_cities.each do |city|
  response = OpenWeatherApi.new().fetch_city(city)

  City.create!(
    name: response[0]['name'],
    lat: response[0]['lat'],
    lon: response[0]['lon'],
    country: response[0]['country'],
    state: response[0]['state']
  )
end
