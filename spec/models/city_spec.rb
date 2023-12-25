require 'rails_helper'

RSpec.describe City, type: :model do
  it 'creates a city' do
    city = create(:city)
    expect(city).to be_valid
  end
end
