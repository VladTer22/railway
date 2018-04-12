class AddTypeToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :seat_type, :string
  end
end
