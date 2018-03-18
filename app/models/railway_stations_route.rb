class RailwayStationsRoute < ApplicationRecord
  belongs_to :route
  belongs_to :railway_station

  validates :number, uniqueness: { scope: :route_id }
  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :arrival_time, :departure_time, presence: true

end
