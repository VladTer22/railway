class AddOccupiedSeatsToCarriages < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :occupied_top, :integer, default: 0
    add_column :carriages, :occupied_bottom, :integer, default: 0
    add_column :carriages, :occupied_side_top, :integer, default: 0
    add_column :carriages, :occupied_side_bottom, :integer, default: 0
    add_column :carriages, :occupied_sitting, :integer, default: 0
  end
end
