class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :impressions
  has_many :post_impressions, dependent: :destroy
  has_many :connections, class_name: "Connection", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_connections, class_name: "Connection", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :connecthions, source: :followed
  has_many :followers, through: :reverse_connections, source: :follower
  has_many :favorites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def favd?(impression_id)
     favorites.where(impression_id: impression_id).exists?
  end
  def follow(user_id)
    connections.create(followed_id: user_id)
  end
  def unfollow(user_id)
    connections.find_by(followed_id: user_id)
  end
  def following?(user)
    followings.include?(user)
  end
end
