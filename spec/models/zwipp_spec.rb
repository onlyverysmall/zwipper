require 'rails_helper'

RSpec.describe Zwipp, type: :model do
  subject { build :zwipp }

  it { should belong_to :user }
  it { should have_many :faving_users }

  it { should validate_presence_of :user }
  it { should validate_presence_of :text }
  it { should validate_length_of(:text).is_at_least(1).is_at_most(140) }
end
