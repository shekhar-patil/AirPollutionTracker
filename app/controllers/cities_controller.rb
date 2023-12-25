class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show ]

  def index
    @cities = City.all
  end

  def show
  end

  private

  def set_city
    @city = City.find(params[:id])
  end
end
