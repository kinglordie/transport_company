class DriversController < ApplicationController
  before_action :set_driver, only: [:edit, :update]
  before_action :check_admin_or_employee, only: [:edit, :update]

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end
  def show
    @driver = Driver.find(params[:id])
  end
  def create
    @driver = Driver.new(driver_params)
    @driver.status = 'free'
    if @driver.save
      redirect_to drivers_path, notice: 'Водитель успешно создан.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @driver.update(driver_params)
      redirect_to drivers_path, notice: 'Информация о водителе обновлена.'
    else
      render :edit
    end
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:lastname, :name, :patronymic, :dr_license, :status, :photo)
  end

  def check_admin_or_employee
    # Проверка, что текущий пользователь является администратором или сотрудником
    redirect_to(root_path) unless current_user.admin? || current_user.employee?
  end
end
