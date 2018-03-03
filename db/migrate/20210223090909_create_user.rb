class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users, &:timestamps
  end
end
