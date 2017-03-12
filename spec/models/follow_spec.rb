require 'rails_helper'

RSpec.describe Follow, type: :model do
  subject { build :follow }

  it { should belong_to :follower }
  it { should belong_to :followee }

  it { should validate_presence_of :follower }
  it { should validate_presence_of :followee }

  # TODO: figure out why this matcher isn't cooperating
  xit { should validate_uniqueness_of(:followee).scoped_to(:follower) }
end
