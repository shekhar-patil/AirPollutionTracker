require 'rails_helper'

RSpec.describe City, type: :model do
  describe '.find_or_initialize_by_name' do
    let(:api) { instance_double('OpenWeatherService') }

    it 'returns existing city if found in the database' do
      existing_city = create(:city, name: 'London')
      found_city = described_class.find_or_initialize_by_name(name: 'London')

      expect(found_city).to eq(existing_city)
    end

    it 'fetches and builds a new city from the API response' do
      api_response = [{ 'name' => 'Delhi', 'lat' => 40.7128, 'lon' => -74.0060 }]

      allow(OpenWeatherService).to receive(:new).and_return(api)
      allow(api).to receive(:fetch_city).with('Delhi').and_return(api_response)

      new_city = described_class.find_or_initialize_by_name(name: 'Delhi')

      expect(new_city.name).to eq('Delhi')
      expect(new_city.latitude).to eq(40.7128)
      expect(new_city.longitude).to eq(-74.0060)
    end
  end
end
