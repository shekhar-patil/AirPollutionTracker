class ImportPollutionDataJob
  include Sidekiq::Job

  def perform(*args)
    City.all.each do |city|
      pollution = fetch_pollution_data(city)
      next unless pollution

      create_pollution_data(city, pollution)
    end
  end

  private

  def fetch_pollution_data(city)
    pollution = OpenWeatherApi.new(city).current_pollution
    pollution["list"].first if pollution && pollution["list"].any?
  end

  def create_pollution_data(city, pollution_data)
    components = pollution_data["components"]
    main_data = pollution_data["main"]
    dt = pollution_data["dt"]

    city.pollution_data.create(
      co: components["co"],
      no: components["no"],
      no2: components["no2"],
      o3: components["o3"],
      so2: components["so2"],
      pm2_5: components["pm2_5"],
      pm10: components["pm10"],
      nh3: components["nh3"],
      dt: dt,
      index: main_data["aqi"]
    )
  end
end
