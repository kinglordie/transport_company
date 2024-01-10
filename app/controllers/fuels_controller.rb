class FuelsController < ApplicationController
  def index
    @fuels = Fuel.includes(:truck).order(date: :desc)

  end

  def new
    @truck = Truck.find(params[:truck_id])
    @fuel = Fuel.new(truck_id: @truck.id)
  end
  
  def create
    @fuel = Fuel.new(fuel_params)
    if @fuel.save
      redirect_to fuels_path, notice: 'Заправка успешно добавлена.'
    else
      render :new
    end
  end
  
  private
  
  def fuel_params
    params.require(:fuel).permit(:truck_id, :date, :type_f, :fuel_l, :price)
  end

  
end
