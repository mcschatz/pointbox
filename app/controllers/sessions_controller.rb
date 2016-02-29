class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    session[:user_id] = @user.id
    if current_admin && @user.authenticate(params[:session][:password])
      redirect_to admin_rewards_path
    elsif @user && @user.authenticate(params[:session][:password])
      redirect_to @user
    else
      flash.now[:errors] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end