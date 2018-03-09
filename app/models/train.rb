class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :route

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
end
