class User < ActiveRecord::Base
  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { maximum: 24 }
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    on: :create # may need to remove if allow users to update email
  }
end
