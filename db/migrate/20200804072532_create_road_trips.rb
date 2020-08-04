class CreateRoadTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :road_trips do |t|
      t.string :name
      t.string :origin
      t.string :destination
      t.string :travel_time
      t.float :arrival_temp
      t.string :arrival_weather_desc
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
