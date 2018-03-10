class CreateCarriages < ActiveRecord::Migration[6.1]
  def change
    create_table :carriages do |t|
      t.boolean :compartment
      t.integer :up_seats
      t.integer :down_seats

      t.timestamps
    end
  end
end
