class AddCurrentStationToTrain < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :current_station_id, :integer
  end
end
