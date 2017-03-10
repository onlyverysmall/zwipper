class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates :followee, :follower, presence: true
  validates :followee, uniqueness: { scope: :follower }
end
