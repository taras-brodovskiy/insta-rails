FactoryBot.define do
  factory :user do
    username { "First" }
    email    { "first@user.com" }
    password { "password" }
  end
end
