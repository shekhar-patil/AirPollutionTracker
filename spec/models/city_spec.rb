require 'rails_helper'

RSpec.describe City, type: :model do
  describe '.find_or_initialize' do
    let(:api) { instance_double('OpenWeatherApi') }

    it 'returns existing city if found in the database' do
      existing_city = create(:city, name: 'London')
      expect(described_class.find_or_initialize('London')).to eq(existing_city)
    end

    it 'fetches and builds a new city from the API response' do
      allow(OpenWeatherApi).to receive(:new).and_return(api)
      allow(api).to receive(:fetch_city).and_return([{ 'name' => 'Delhi', 'lat' => 40.7128, 'lon' => -74.0060 }])

      new_city = described_class.find_or_initialize('Delhi')
      expect(new_city.name).to eq('Delhi')
      expect(new_city.lat).to eq(40.7128)
      expect(new_city.lon).to eq(-74.0060)
    end
  end
end
