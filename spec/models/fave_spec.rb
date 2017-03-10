require 'rails_helper'

RSpec.describe Fave, type: :model do
  let(:user) { User.new(username: 'sally', email: 'sally@email.com') }
  let(:zwipp) { Zwipp.new(user: user, text: 'some really great zwippy text!') }
  subject { Fave.new(user: user, zwipp: zwipp) }

  it { should belong_to :user }
  it { should belong_to :zwipp }

  it { should validate_presence_of :user }
  it { should validate_presence_of :zwipp }

  # TODO: figure out why this matcher isn't cooperating
  xit { should validate_uniqueness_of(:user).scoped_to(:zwipp) }
end
