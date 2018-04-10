class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_train, only: %i[new create]
  before_action :appoint_stations, only: %i[create]
  before_action :find_ticket, only: %i[show destroy]

  def index
    @tickets = current_user.tickets
  end

  def show
    return @ticket if current_user.tickets.includes(@ticket)

    redirect_to root_path, alert: 'You don\'t have enough rights to access this page!'
  end

  def new
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    @ticket = Ticket.new
  end

  def create
    p = ticket_params
    p[:start_station] = @start_station
    p[:end_station] = @end_station
    @ticket = @train.tickets.build(p)
    @ticket.user = current_user
    if @ticket.save
      redirect_to tickets_path(@start_station, @end_station), notice: 'Ticket was successfully created.'
    else
      redirect_to new_train_ticket_path(@train)
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to admin_tickets_path, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def appoint_stations
    start_id = params[:ticket][:start_station]
    end_id = params[:ticket][:end_station]
    @start_station = RailwayStation.find(start_id)
    @end_station = RailwayStation.find(end_id)
  end

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name, :user_passport, \
                                   :start_station, :end_station)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end
end
