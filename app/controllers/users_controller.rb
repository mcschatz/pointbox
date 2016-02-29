class UsersController < ApplicationController
  before_filter :current_admin, except [:show]

  def show
    @user = User.find(params[:id])
    @rewards = Reward.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      # re-render new view if validation don't pass
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end