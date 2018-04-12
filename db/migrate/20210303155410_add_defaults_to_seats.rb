class AddDefaultsToSeats < ActiveRecord::Migration[6.1]
  def change
    change_column_default :carriages, :up_seats, 0
    change_column_default :carriages, :down_seats, 0
    change_column_default :carriages, :side_seats_bottom, 0
    change_column_default :carriages, :side_seats_top, 0
    change_column_default :carriages, :sitting_seats, 0
  end
end
