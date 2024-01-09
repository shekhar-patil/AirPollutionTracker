namespace :import do
  desc 'Import historical pollution data'
  task historical_pollution_data: :environment do
    cities = City.all
    current_date = DateTime.now

    12.times do |month_ago|
      start_date = (current_date << (month_ago + 1)).strftime('%s')
      end_date = (current_date << month_ago).strftime('%s')

      cities.each do |city|
        api = OpenWeatherService.new(city)
        historical_data = api.historical_pollution(start_date, end_date)

        next unless historical_data && historical_data['list'] && !historical_data['list'].empty?

        # Assuming we want to store only the first entry of historical data for each month
        pollution_data = historical_data['list'].first

        save_pollution_data(city, pollution_data)
      end
    end
  end

  def save_pollution_data(city, pollution_data)
    return unless city && pollution_data

    components = pollution_data['components']
    main_data = pollution_data['main']
    dt = pollution_data['dt']

    city.pollution_data.create(
      co: components['co'],
      no: components['no'],
      no2: components['no2'],
      o3: components['o3'],
      so2: components['so2'],
      pm2_5: components['pm2_5'],
      pm10: components['pm10'],
      nh3: components['nh3'],
      dt: dt,
      index: main_data['aqi']
    )
  end
end
