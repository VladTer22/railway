class AddNumberToRailwayStationRoute < ActiveRecord::Migration[6.1]
  def change
    add_column :railway_stations_routes, :number, :integer
  end
end
