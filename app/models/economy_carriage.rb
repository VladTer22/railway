class EconomyCarriage < Carriage
  validates_numericality_of :up_seats, :side_seats_top, \
                            :down_seats, :side_seats_bottom, greater_than: 0.0
end
