require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe 'GET #index' do
    it 'handles database query errors' do
      allow(City).to receive(:all).and_raise(StandardError)

      expect { get :index }.to raise_error(StandardError)
    end

    it 'assigns @average_aqi_per_state' do
      # Assuming `calculate_average_aqi_per_state` is a private method
      allow_any_instance_of(CitiesController).to receive(:calculate_average_aqi_per_state).and_return([])

      get :index
      expect(assigns(:average_aqi_per_state)).to eq([])
    end
  end

  describe 'GET #show' do
    it 'assigns @monthly_avg_aqi_per_location and @average_aqi_per_location' do
      city = create(:city)
      pollution_datum = create(:pollution_datum, city: city)
      get :show, params: { id: city.id }

      expect(assigns(:monthly_avg_aqi_per_location)).to be_present
      expect(assigns(:average_aqi_per_location)).to be_present
    end

    it 'handles non-existent city ID' do
      non_existent_id = 9999

      expect { get :show, params: { id: non_existent_id } }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
