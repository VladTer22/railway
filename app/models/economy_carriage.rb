class EconomyCarriage < Carriage
  validates :occupied_bottom, numericality: {less_than_or_equal_to: :down_seats}, on: :update
  validates :occupied_top, numericality: {less_than_or_equal_to: :up_seats}, on: :update
  validates :occupied_side_bottom, numericality: {less_than_or_equal_to: :side_seats_bottom}, on: :update
  validates :occupied_side_top, numericality: {less_than_or_equal_to: :side_seats_top}, on: :update
  validates_numericality_of :up_seats, :side_seats_top, \
    :down_seats, :side_seats_bottom, greater_than: 0.0
end
