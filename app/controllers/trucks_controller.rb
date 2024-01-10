class TrucksController < ApplicationController
  def index
    @trucks = Truck.all
  end

  def show
    @truck = Truck.find(params[:id])
  end
  def new
    @truck = Truck.new
  end
  def edit
    @truck = Truck.find(params[:id])
  end
  def create
    @truck = Truck.new(truck_params)
    if @truck.save
      redirect_to trucks_path, notice: 'Грузовик успешно создан.'
    else
      render :new
    end
  end
  def update
    @truck = Truck.find(params[:id])
  if @truck.update(truck_params)
    redirect_to @truck
  else
    render :edit
  end
  end

  private

  def truck_params
    params.require(:truck).permit(:car_number, :model, :year, :VIN, :STS, :status, :photo)
  end
end
