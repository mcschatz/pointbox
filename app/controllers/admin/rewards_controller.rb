class Admin::RewardsController < Admin::BaseController
  def index
    @rewards = Reward.all
    @users = User.all
  end

  def update
    User.find_by(id: params[:id]).change_points(params[:quantity])
    redirect_to :back
  end
end