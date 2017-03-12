FactoryGirl.define do
  sequence(:username) { |n| "sally#{ n }" }
  sequence(:email)    { |n| "sally#{ n }@test.com" }
  sequence(:text)     { |n| "super great zwipp #{ n }" }

  factory :user do
    username
    email
    password "testing123"
  end

  factory :zwipp do
    user
    text
  end

  factory :follow do
    association :follower, factory: :user
    association :followee, factory: :user
  end

  factory :fave do
    association :user
    association :zwipp
  end
end
