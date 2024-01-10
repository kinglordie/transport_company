class UsersController < ApplicationController
    before_action :set_user, only: [:update_role]
  
    def index
      @users = User.all.order(id: :asc)
    end
  
    def update_role
        if @user.update(user_params)
          redirect_to users_path, notice: "Роль обновлена"
        else
          redirect_to users_path, alert: @user.errors.full_messages.to_sentence
        end
      end
      
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:role)
    end
  end
  