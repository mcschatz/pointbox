class Reward < ActiveRecord::Base
  has_many :user_rewards, dependent: :destroy
  has_many :users, through: :user_rewards
end