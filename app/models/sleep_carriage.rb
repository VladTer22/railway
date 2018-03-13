class SleepCarriage < Carriage
  validates_numericality_of :down_seats, greater_than: 0.0
end