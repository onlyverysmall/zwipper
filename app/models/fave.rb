class Fave < ActiveRecord::Base
  belongs_to :user
  belongs_to :zwipp

  validates :user, :zwipp, presence: true
  validates :user, uniqueness: { scope: :zwipp }
end
