class SalariesController < ApplicationController
  def index
    @salaries = Salary.all.order(salary_date: :desc)
  end
  def show
    @salary = Salary.find(params[:id])
  end
  def new
    @driver = Driver.find(params[:driver_id])
    @salary = Salary.new(driver_id: @driver.id)
  end
  def update
    @salary = Salary.find(params[:id])
  if @salary.update(salary_params)
    redirect_to @salary
  else
    render :edit
  end
  end
  def create
    @salary = Salary.new(salary_params)
    if @salary.save
      redirect_to salaries_path, notice: 'Выплата успешно добавлена.'
    else
      render :new
    end
  end
  
  private
  
  def salary_params
    params.require(:salary).permit(:driver_id, :salary_date, :km_rate,:reis,:travel_allow,:downtime, :premium)
  end
  
end
