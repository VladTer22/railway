class Carriage < ApplicationRecord
  validates_numericality_of :up_seats, greater_than: 0.0
  validates_numericality_of :down_seats, greater_than: 0.0

  belongs_to :trains_ids, class_name: 'Train', foreign_key: :train_id
end
