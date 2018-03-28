module Admin
  class TicketsController < Admin::BaseController
    before_action :find_ticket, only: %i[show edit destroy]

    def index
      @tickets = Ticket.all
    end

    def show; end

    def edit; end

    def destroy
      @ticket.destroy
      respond_to do |format|
        format.html { redirect_to admin_tickets_path, notice: 'Ticket was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def find_ticket
      @ticket = Ticket.find(params[:id])
    end

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
  end
end
