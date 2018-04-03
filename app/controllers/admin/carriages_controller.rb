module Admin
  class CarriagesController < Admin::BaseController
    before_action :find_carriage, only: %i[show edit update destroy]

    def index
      @carriage = Carriage.all
    end

    def show; end

    def new
      @carriage = Carriage.new
      @train = Train.find(params[:train_id])
    end

    def edit; end

    def create
      @carriage = Carriage.new(carriage_params)

      respond_to do |format|
        if @carriage.save
          format.html { redirect_to @train, notice: 'Carriage was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @carriage.update(carriage_params)
          format.html { redirect_to @carriage.becomes(Carriage), notice: 'Carriage was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @carriage.destroy
      respond_to do |format|
        format.html { redirect_to admin_carriage_url, notice: 'Carriage was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def find_carriage
      @carriage = Carriage.find(params[:id])
    end

    def carriage_params
      params.require(:carriage).permit(:number, :up_seats, :down_seats, :train_id, \
                                       :sitting_seats, :side_seats_top, :side_seats_bottom, :type)
    end
  end
end
