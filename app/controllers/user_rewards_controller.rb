class UserRewardsController < ApplicationController
  def create
    if current_user.redeem_reward?(params[:reward_id])
      UserReward.create(user_id: current_user.id, reward_id: params[:reward_id])
      flash.now[:notice] = "You're eligable for a reward. Congratulations!"
    else
      flash.now[:notice] = "You need more points to redeem a reward."
    end
    redirect_to :back
  end
end