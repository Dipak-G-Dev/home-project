class User < ApplicationRecord
  # Associations
  has_many :sleeps, dependent: :destroy
  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :followees, through: :follows
end
