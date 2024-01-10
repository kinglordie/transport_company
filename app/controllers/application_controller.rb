class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :patronymic, :role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :patronymic, :role])
    end

    def after_sign_in_path_for(resource)
      # Здесь укажите путь, на который должен быть перенаправлен пользователь после входа
      profile_path # Пример
    end
  end
  