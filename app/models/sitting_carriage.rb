class SittingCarriage < Carriage
  validates :occupied_sitting, numericality: {less_than_or_equal_to: :sitting_seats}, on: :update
  validates_numericality_of :sitting_seats, greater_than: 0.0
end