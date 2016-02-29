class RewardsController < ApplicationController
  def new
    @reward = Reward.new
  end

  def update
    reward = Reward.find(params[:id])
    reward.update_attributes(reward_params)
    redirect_to admin_rewards_path
  end

  def create
    Reward.create(reward_params)
    redirect_to admin_rewards_path
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def destroy
    Reward.find(params[:id]).destroy
    redirect_to admin_rewards_path
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :point_value)
  end
end