FactoryGirl.define do
  
  sequence :email do |n|
    "foo#{n}@example.com"
  end

  factory :user do
    username { "foouser" }
    email
    password { "password" }
    # password confirmation not needed here
    confirmed_at Time.now
  end

  factory :profile do
    full_name "Foo Bar"
    website "http://example.com"
    bio "a" * 15
    association :user
  end

end