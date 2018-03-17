class AddUserDataToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :user_first_name, :text
    add_column :tickets, :user_last_name, :text
    add_column :tickets, :user_middle_name, :text
    add_column :tickets, :user_passport, :text
  end
end
