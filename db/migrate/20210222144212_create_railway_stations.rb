class CreateRailwayStations < ActiveRecord::Migration[6.1]
  def change
    create_table :railway_stations do |t|
      t.string :title

      t.timestamps
    end
  end
end
