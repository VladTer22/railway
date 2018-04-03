class SearchesController < ApplicationController
  before_action :authenticate_user!
  def show
    @stations = RailwayStation.all
  end

  def search
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    if @start_station.title == @end_station.title
      redirect_to search_path, alert: 'Start station can\'t be the same as end station!'
    end
    @routes = Route.searched_routes(@start_station, @end_station)
  end
end
