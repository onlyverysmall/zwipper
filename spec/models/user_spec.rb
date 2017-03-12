require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  it { should have_many :zwipps }
  it { should have_many :faved_zwipps }
  it { should have_many :followees }
  it { should have_many :followers }

  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_length_of :username }
  it { should allow_value('sally@email.com').for :email }
  it { should_not allow_value('notemail').for :email }
end
