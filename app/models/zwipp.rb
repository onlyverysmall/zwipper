class Zwipp < ActiveRecord::Base
  belongs_to :user
  has_many :faving_users, class_name: 'Fave', dependent: :destroy

  validates :user, :text, presence: true
  validates :text, length: { in: 1..140 }

  scope :feed_for, ->(user) {
    where(user_id: user.followees.pluck(:id))
    .order(created_at: :desc)
  }
end
