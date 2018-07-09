class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      flash[:success] = 'Logged In'
      redirect_to user
    else
      flash[:danger] = 'No email found'
      redirect_to login_path
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'Logged Out'
    redirect_to root_url
  end
end
