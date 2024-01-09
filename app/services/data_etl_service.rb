require 'activerecord-import'

class DataEtlService
  def initialize(data_source, options)
    @data_source = data_source
    @options = options
  end

  def extract_data_from_api(options)
    @data_source.constantize.new(options).current_pollution
  end

  def transform_pollution_data(model, city, pollution_data)
    components = pollution_data['list'][0]['components']
    main_data = pollution_data['list'][0]['main']
    dt = pollution_data['list'][0]["dt"]

    city.pollution_data.new(
      carbon_monoxide: components["co"],
      nitric_oxide: components["no"],
      nitrogen_dioxide: components["no2"],
      ozone: components["o3"],
      sulfur_dioxide: components["so2"],
      particulate_matter_2_5: components["pm2_5"],
      particulate_matter_10: components["pm10"],
      ammonia: components["nh3"],
      timestamp: dt,
      data_index: main_data["aqi"]
    )
  end


  def load_data(transformed_data, model)
    model.import(model.column_names, transformed_data, validate: false)
  end

  def run_pollution_etl_process(model)
    batch_size = 50

    City.find_in_batches(batch_size: batch_size) do |cities_batch|
      transformed_data = []

      cities_batch.each do |city|
        response = extract_data_from_api({ city: city })
        transformed_data << transform_pollution_data(model, city, response)
      end

      load_data(transformed_data, model)
    end
  end
end
