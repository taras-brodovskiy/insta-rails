FactoryBot.define do
  factory :like do
    instapost
    user
  end

  factory :comment do
    sequence(:caption) { |n| "Comment test caption #{n}" }
    instapost
    user
  end  

  factory :instapost do
    sequence(:caption) { |n| "Instapost test caption #{n}" }
    user
  end

  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:email)    { |n| "user#{n}@mail.com" }
    password            { 'foobar' }

    factory :user_with_instaposts do
      transient do
        instaposts_count { 2 }
      end

      after(:create) do |user, evaluator|
        create_list(:instapost, evaluator.instaposts_count, user: user)
      end
    end

    factory :user_commenter do
      transient do
        comments_count { 2 }
      end

      after(:create) do |user, evaluator|
        commented_user = create(:user_with_instaposts)
        commented_user.instaposts.each do |instapost|        
          evaluator.comments_count.times do
            instapost.comments << create(:comment, instapost: instapost, user: user)
          end
        end
      end
    end

    factory :user_liker do
      after(:create) do |user, evaluator|
        liked_user = create(:user_with_instaposts)
        liked_user.instaposts.each do |instapost|
        instapost.likes << create(:like, instapost: instapost, user: user)
        end
      end
    end
  end
end
