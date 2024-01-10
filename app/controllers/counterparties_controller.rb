class CounterpartiesController < ApplicationController
  before_action :set_counterparty, only: [:edit, :update, :destroy]
  before_action :check_admin_or_employee, only: [:new, :create, :edit, :update, :destroy]
  def index
    @counterparties = Counterparty.all
  end

  def new
    @counterparty = Counterparty.new
  end

  def create
    @counterparty = Counterparty.new(counterparty_params)
    @counterparty.status = 'active'
    if @counterparty.save
      redirect_to counterparties_path, notice: 'Контрагент успешно создан.'
    else
      render :new
    end
  end
  def show
    @counterparty = Counterparty.find(params[:id])
  end
  def edit
  end

  def update
    if @counterparty.update(counterparty_params)
      redirect_to counterparties_path, notice: 'Информация о водителе обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @counterparty.destroy
    redirect_to counterparties_path, notice: 'Контрагент удален.'
  end

  private

  def set_counterparty
    @counterparty = Counterparty.find(params[:id])
  end

  def counterparty_params
    params.require(:counterparty).permit(:name, :contact, :INN, :email, :post, :status)
  end

  def check_admin_or_employee
    redirect_to(root_path) unless current_user.admin? || current_user.employee?
  end

end
