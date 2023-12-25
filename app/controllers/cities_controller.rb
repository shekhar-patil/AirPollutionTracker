class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show ]

  def index
    @cities = City.all

    @average_aqi_per_state ||= City.joins(:pollution_data)
                                   .select("cities.state AS state_name, AVG(pollution_data.index) AS avg_aqi")
                                   .group("cities.state")
  end

  def show
    @monthly_avg_aqi_per_location ||= City.joins(:pollution_data).where(id: @city)
                                           .select("EXTRACT(MONTH FROM TO_TIMESTAMP(pollution_data.dt)) AS month, AVG(pollution_data.index) AS avg_aqi")
                                           .group("EXTRACT(MONTH FROM TO_TIMESTAMP(pollution_data.dt))")


    @average_aqi_per_location ||= City.joins(:pollution_data).where(id: @city)
                                           .select("cities.id, AVG(pollution_data.index) AS avg_aqi")
                                           .group("cities.id")

  end

  private

  def set_city
    @city = City.includes(:pollution_data).find(params[:id])
  end
end
