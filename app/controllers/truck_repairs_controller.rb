class TruckRepairsController < ApplicationController
  def index
    #@truck_repairs = TruckRepair.all
    @truck_repairs = TruckRepair.all.order(date_repair: :desc)
  end

  def new
    @truck = Truck.find(params[:truck_id])
    @truck_repair = TruckRepair.new(truck_id: @truck.id)
  end
  
  def create
    @truck_repair = TruckRepair.new(truck_repair_params)
    if @truck_repair.save
      redirect_to truck_repairs_path, notice: 'Ремонт успешно добавлен.'
    else
      render :new
    end
  end
  
  private
  
  def truck_repair_params
    params.require(:truck_repair).permit(:truck_id, :date_repair, :part_name, :price)
  end
  
end
