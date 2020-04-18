FactoryBot.define do
  factory :instapost do
    caption { "MyText" }
    user { nil }
  end

  factory :user do
    username { "First" }
    email    { "first@user.com" }
    password { "password" }
  end
end
