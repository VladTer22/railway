class SittingCarriage < Carriage
  validates_numericality_of :sitting_seats, greater_than: 0.0
end