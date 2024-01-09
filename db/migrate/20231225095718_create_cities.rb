class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :latitude   # Renamed 'lat' to 'latitude'
      t.float :longitude  # Renamed 'lon' to 'longitude'
      t.string :country
      t.string :state

      t.timestamps
    end
  end
end
