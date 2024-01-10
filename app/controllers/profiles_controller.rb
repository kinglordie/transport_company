class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    # Дополнительная логика, если требуется
  end
end
