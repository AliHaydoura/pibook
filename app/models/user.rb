class User < ApplicationRecord
  has_many :follower_relationships, foreign_key: :followed_id, class_name: "Follow"
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :following_relationships, source: :followed

  has_many :posts

  validates :username, presence: true, uniqueness: true, length: { in: 3..15 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
