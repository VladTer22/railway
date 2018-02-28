class Train < ApplicationRecord

  belongs_to :route
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
end
