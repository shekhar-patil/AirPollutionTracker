class ImportPollutionDataJob
  include Sidekiq::Job

  def perform(*args)
    City.all.each do |c|
      pollution = OpenWeatherApi.new(c).current_pollution
      pollution_data = pollution["list"].first

      co = pollution_data["components"]["co"]
      no = pollution_data["components"]["no"]
      no2 = pollution_data["components"]["no2"]
      o3 = pollution_data["components"]["o3"]
      so2 = pollution_data["components"]["so2"]
      pm2_5 = pollution_data["components"]["pm2_5"]
      pm10 = pollution_data["components"]["pm10"]
      nh3 = pollution_data["components"]["nh3"]
      dt = pollution_data["dt"]
      index = pollution_data["main"]["aqi"]

      c.pollution_data.create(
        co: co,
        no: no,
        no2: no2,
        o3: o3,
        so2: so2,
        pm2_5: pm2_5,
        pm10: pm10,
        nh3: nh3,
        dt: dt,
        index: index
      )
    end
  end
end
