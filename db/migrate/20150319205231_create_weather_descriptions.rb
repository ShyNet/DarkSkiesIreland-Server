class CreateWeatherDescriptions < ActiveRecord::Migration
  def change
    create_table :weather_descriptions do |t|
      t.integer :day
      t.integer :timeframe

      t.timestamps null: false
    end
  end
end
