class CoupeCarriage < Carriage
  validates :occupied_bottom, numericality: {less_than_or_equal_to: :down_seats}, on: :update
  validates :occupied_top, numericality: {less_than_or_equal_to: :up_seats}, on: :update
  validates_numericality_of :up_seats, :down_seats, greater_than: 0.0
end
