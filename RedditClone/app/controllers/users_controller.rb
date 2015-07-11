class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    unless @user.save
      flash.now[:errors] = @user.errors.full_messages
      render :new
    else
      log_in(@user)
      render text: "Logged in as #{@user.username}"
    end
  end

  def new
    @user = User.new
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
