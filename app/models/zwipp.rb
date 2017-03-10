class Zwipp < ActiveRecord::Base
  belongs_to :user
  has_many :faving_users, class_name: 'Fave', dependent: :destroy

  validates :user, :text, presence: true
  validates :text, length: { in: 1..140 }
end
