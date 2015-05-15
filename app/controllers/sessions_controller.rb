class SessionsController < ApplicationController
  before_action :check_if_already_logged_in, except: [:destroy]

  def new
    @user = User.new
    render :new
  end

  def check_if_already_logged_in
    redirect_to subs_url if logged_in?
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user.nil?
      flash.now[:errors] = ["Username and/or password invalid"]
      render :new
    else
      log_in(@user)
      redirect_to subs_url
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
