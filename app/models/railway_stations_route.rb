class RailwayStationsRoute < ApplicationRecord
  belongs_to :route
  belongs_to :railway_station

  after_create_commit :assign_number

  validates :number, uniqueness: { scope: :route_id }, on: :update
  validates :railway_station_id, uniqueness: { scope: :route_id }

  def assign_number
    max = RailwayStationsRoute.where(route_id: route_id).maximum(:number)
    self.number ||= max.nil? ? 1 : max + 1
    save
  end

end
