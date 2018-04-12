class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :route

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  has_many :tickets

  has_many :carriages
  has_many :carriages, ->(train) { order("number #{train.direction ? "ASC" : "DESC"}") }

  scope :get_number_of_seats, ->(carriage_type, seats_type) { carriages.where(type: carriage_type).sum(seats_type) }

  def occupy(carriage_type, seat)
    carriage = carriages.find { |car| car.class.to_s == carriage_type && car.available_seats(seat) > 0 }
    carriage.occupy(seat)
  end

  def get_carriage_types
    types = []
    carriages.each { |car| types << car.class.to_s }
    types.uniq
  end
end
