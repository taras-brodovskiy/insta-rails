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

# Create instaposts
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

# Create likes
users.each do |user|
  likes = Random.rand(19) + 1
  posts = []
  likes.times do
    posts << Random.rand(199) + 1
  end
  posts.uniq!
  posts.each do |post|
    instapost = Instapost.find_by(id: post)
    Like.create!(user: user, instapost: instapost)
    caption = Faker::Movies::LordOfTheRings.quote
    Comment.create!(user: user, instapost: instapost, caption: caption)
  end 
end
