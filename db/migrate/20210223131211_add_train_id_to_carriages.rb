class AddTrainIdToCarriages < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :carriages, :train
  end
end
