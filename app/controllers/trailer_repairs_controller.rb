class TrailerRepairsController < ApplicationController
  def index
    @trailer_repairs = TrailerRepair.all.order(date_repair: :desc)
  end

  def new
    @trailer = Trailer.find(params[:trailer_id])
    @trailer_repair = TrailerRepair.new(trailer_id: @trailer.id)
  end
  
  def create
    @trailer_repair = TrailerRepair.new(trailer_repair_params)
    if @trailer_repair.save
      redirect_to trailer_repairs_path, notice: 'Ремонт успешно добавлен.'
    else
      render :new
    end
  end
  
  private
  
  def trailer_repair_params
    params.require(:trailer_repair).permit(:trailer_id, :date_repair, :part_name, :price)
  end
  
end
