class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def search
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    @routes = Route.searched_routes(@start_station, @end_station)
  end
end
