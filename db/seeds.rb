# Create user
20.times do |n|
  username = Faker::Movies::LordOfTheRings.unique.character
  email = username.downcase.delete('^a-z').concat("@mearth.com")
  password = "foobar"
  password_confirmation = "foobar"
  User.create!(username: username, email: email,
               password: password,
               password_confirmation: password_confirmation)
end

users = User.all

# Create microposts
users.each do |user|
  10.times do
    caption = Faker::Movies::LordOfTheRings.quote
    Instapost.create!(caption: caption, user: user)
  end
end

# Create relationships between users
leaders    = User.first(10)
followers  = User.last(10)

followers.each do |follower|
  leaders.each do |leader|
    follower.follow(leader)
  end
end

superleaders = User.first(5) 
subleaders   = User.limit(5).offset(5)

subleaders.each do |subleader|
  superleaders.each do |superleader|
    subleader.follow(superleader)
  end
end
