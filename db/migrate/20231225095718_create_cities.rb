class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :lat
      t.float :lon
      t.string :country
      t.string :state

      t.timestamps
    end
  end
end
