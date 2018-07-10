class UsersController < ApplicationController
  include UsersHelper
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    log_in(@user)
    flash[:success] = 'User created'
    redirect_to @user
  end

  def show
    @user = User.find_by(id: params[:id])
    @upcoming_events = upcoming_events(current_user)
    @previous_events = previous_events(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
