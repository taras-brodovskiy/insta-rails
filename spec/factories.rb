FactoryBot.define do  
  factory :instapost do
    sequence(:caption) { |n| "Some test caption ##{n}" }
    user
  end

  factory :user do
    username { "First" }
    email    { "first@user.com" }
    password { "foobar" }

    factory :user_with_instaposts do
      transient do
        instaposts_count { 3 }
      end

      after(:create) do |user, evaluator|
        create_list(:instapost, evaluator.instaposts_count, user: user)
      end
    end
  end
end
