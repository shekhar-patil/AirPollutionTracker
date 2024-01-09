class CreatePollutionData < ActiveRecord::Migration[7.0]
  def change
    create_table :pollution_data do |t|
      t.float :carbon_monoxide     # CO levels
      t.float :nitric_oxide        # NO levels
      t.float :nitrogen_dioxide    # NO2 levels
      t.float :ozone               # O3 levels
      t.float :sulfur_dioxide      # SO2 levels
      t.float :particulate_matter_2_5  # PM2.5 levels
      t.float :particulate_matter_10   # PM10 levels
      t.float :ammonia             # NH3 levels
      t.bigint :timestamp          # Timestamp for the pollution data
      t.integer :data_index        # Index for the pollution data
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
