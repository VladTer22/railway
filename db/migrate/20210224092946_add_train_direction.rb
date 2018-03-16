class AddTrainDirection < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :direction, :boolean
  end
end
