class RenameCarriageAttribute < ActiveRecord::Migration[6.1]
  def change
    remove_column :carriages, :compartment
    add_column :carriages, :type, :string
    add_column :carriages, :side_seats_top, :integer
    add_column :carriages, :side_seats_bottom, :integer
    add_column :carriages, :sitting_seats, :integer
  end
end
