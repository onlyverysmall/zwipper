require 'rails_helper'

RSpec.describe Zwipp, type: :model do
  subject { build :zwipp }

  it { should belong_to :user }
  it { should have_many :faving_users }

  it { should validate_presence_of :user }
  it { should validate_presence_of :text }
  it { should validate_length_of(:text).is_at_least(1).is_at_most(140) }

  describe '.feed_for' do
    it 'returns the correct zwipps in the correct order' do
      user      = create :user
      followee  = create :user
      follow    = create :follow, follower: user, followee: followee
      newest    = create :zwipp, user: followee, created_at: 1.minute.ago
      oldest    = create :zwipp, user: followee, created_at: 1.day.ago
      unrelated = create :zwipp, user: create(:user)

      expect(Zwipp.feed_for(user)).to eq [newest, oldest]
    end
  end
end
