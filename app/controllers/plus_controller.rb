class PlusController < ApplicationController

  before_action :authenticate_user!, only: [:edit]

  def index
    if current_user
      @user = User.find(current_user)
      @is_admin = @user.is_admin?
    end
  end

  def edit
    @user = User.find(current_user)
    @is_admin = @user.is_admin?
    if(@is_admin == false)
      flash[:alert] = "You have to be an admin to get to this page."
      redirect_to action: 'index'
    end
  end
end
