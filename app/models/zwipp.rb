class Zwipp < ActiveRecord::Base
  belongs_to :user

  validates :user, :text, presence: true
  validates :text, length: { in: 1..140 }
end
