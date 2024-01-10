class ReisTablesController < ApplicationController
    def index
      #@truck_repairs = TruckRepair.all
      @reis_tables = ReisTable.all
    end
  
    def new
      @reis_table = ReisTable.new
    end
    def show
        @reis_table = ReisTable.find(params[:id])
      end
    def create
      @reis_table = ReisTable.new(reis_table_params)
      if @reis_table.save
        redirect_to reis_tables_path, notice: 'Рейс успешно добавлен.'
      else
        render :new
      end
    end
    def update
        @reis_table = ReisTable.find(params[:id])
        if @reis_table.update(reis_table_params)
          redirect_to reis_tables_path, notice: 'Информация о рейсе обновлена.'
        else
          render :reis_tables_path
        end
      end

    private

    

    def reis_table_params
      params.require(:reis_table).permit(:truck_id, :driver_id, :trailer_id, :counterparty_id,:loading,:unloading,:date_load,:date_unload,:cargo_name,:km,:rate,:tonnage,:nds,:sum,:due_date,:invoice_date,:letter_date,:deadline,:status,:tracking_number)
    end
    def check_admin_or_employee
        # Проверка, что текущий пользователь является администратором или сотрудником
        redirect_to(root_path) unless current_user.admin? || current_user.employee?
      end
  end
  