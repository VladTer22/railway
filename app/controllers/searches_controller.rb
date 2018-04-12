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

  def change_locale
    l = params[:locale].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    cookies.permanent[:my_locale] = l
    redirect_to request.referer || root_url
  end
end
