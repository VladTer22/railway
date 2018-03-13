class CoupeCarriage < Carriage
  validates_numericality_of :up_seats, :down_seats, greater_than: 0.0
end
