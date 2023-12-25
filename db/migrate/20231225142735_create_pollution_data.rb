class CreatePollutionData < ActiveRecord::Migration[7.0]
  def change
    create_table :pollution_data do |t|
      t.float :co
      t.float :no
      t.float :no2
      t.float :o3
      t.float :so2
      t.float :pm2_5
      t.float :pm10
      t.float :nh3
      t.bigint :dt
      t.integer :index
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
