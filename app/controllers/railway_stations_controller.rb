class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: %i[ show edit update destroy ]

  # GET /railway_stations or /railway_stations.json
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1 or /railway_stations/1.json
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations or /railway_stations.json
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: "Railway station was successfully created." }
        format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /railway_stations/1 or /railway_stations/1.json
  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: "Railway station was successfully updated." }
        format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /railway_stations/1 or /railway_stations/1.json
  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: "Railway station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
