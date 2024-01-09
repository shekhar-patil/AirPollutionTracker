class CitiesController < ApplicationController
  before_action :set_city, only: [:show]

  def index
    @cities = City.all
    @average_aqi_per_state = calculate_average_aqi_per_state
  end

  def show
    @monthly_avg_aqi_per_location = calculate_monthly_avg_aqi_per_location
    @average_aqi_per_location = calculate_average_aqi_per_location
  end

  private

  def set_city
    @city = City.includes(:pollution_data).find(params[:id])
  end

  def calculate_average_aqi_per_state
    City.joins(:pollution_data)
        .select("cities.state AS state_name, AVG(pollution_data.data_index) AS avg_aqi")
        .group("cities.state")
  end

  def calculate_monthly_avg_aqi_per_location
    City.joins(:pollution_data)
        .where(id: @city)
        .select("EXTRACT(MONTH FROM TO_TIMESTAMP(pollution_data.timestamp)) AS month, AVG(pollution_data.data_index) AS avg_aqi")
        .group("EXTRACT(MONTH FROM TO_TIMESTAMP(pollution_data.timestamp))")
  end

  def calculate_average_aqi_per_location
    City.joins(:pollution_data)
        .where(id: @city)
        .select("cities.id, AVG(pollution_data.data_index) AS avg_aqi")
        .group("cities.id")
  end
end
