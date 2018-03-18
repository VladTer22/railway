class Route < ActiveRecord::Base
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  scope :with_station, ->(station) { Route.joins(:railway_stations).where('railway_stations.id = ?', station.id) }

  def first_station
    railway_stations.first
  end

  def last_station
    railway_stations.last
  end

  def self.searched_routes(start_station, end_station)
    Route.with_station(start_station) &
      Route.with_station(end_station)
  end
end
