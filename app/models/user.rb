class User < ActiveRecord::Base
  has_many :zwipps, dependent: :destroy
  has_many :faved_zwipps, class_name: 'Fave', dependent: :destroy

  has_many :follower_assn, class_name: 'Follow', foreign_key: 'followee_id'
  has_many :followers, through: :follower_assn

  has_many :followee_assn, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followees, through: :followee_assn

  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { maximum: 24 }
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    on: :create # may need to remove if allow users to update email
  }
end
