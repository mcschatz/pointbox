class User < ActiveRecord::Base

  has_secure_password

  has_many :user_rewards, dependent: :destroy
  has_many :rewards, through: :user_rewards

  enum role: %w(default admin)

  def redeem_reward?(reward_id)
    reward_points = Reward.find(reward_id.to_i).point_value
    subtract_points(reward_points) if points - reward_points >= 0
  end

  def subtract_points(reward_points)
    update_attributes(points: (points - reward_points))
  end

  def change_points(amount)
    hash = {"increase" => 1, "decrease" => -1}
    update_attributes(points: points + hash[amount])
  end
end