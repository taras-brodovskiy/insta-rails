# Create user
20.times do |n|
  username = Faker::Movies::LordOfTheRings.unique.character
  email = username.downcase.delete('^a-z').concat("@me.com")
  password = "foobar"
  password_confirmation = "foobar"
  User.create!(username: username, email: email,
               password: password,
               password_confirmation: password_confirmation)
end

# Create instaposts
users = User.all
users.each do |user|    
  n = Random.rand(10)  
  n.times do
    caption = Faker::Movies::LordOfTheRings.quote
    #uploader = ImageUploader.new(:store)
    #file = File.new(Rails.root.join('public/placeholders/default.png'))
    #uploaded_file = uploader.upload(file)
    #Instapost.create!(caption: caption, image_data: uploaded_file.to_json, user: user)
    Instapost.create!(caption: caption, user: user)
  end
end

# Create relationships between users
users.each do |user|
  follows = Random.rand(User.count - 2) + 1
  followings = []
  follows.times do
    followings << Random.rand(User.count - 2) + 1
  end
  followings.uniq!
  followings.delete(user.id)
  followings.each do |following|
    f = User.find(following)
    user.follow(f)
  end
end

# Create likes and comments
users.each do |user|
  likes = Random.rand(User.count - 1) + 1
  posts = []
  likes.times do
    posts << Random.rand(Instapost.count - 1) + 1
  end
  posts.uniq!
  posts.each do |post|
    instapost = Instapost.find_by(id: post)
    Like.create!(user: user, instapost: instapost)
    caption = Faker::Movies::LordOfTheRings.quote
    Comment.create!(user: user, instapost: instapost, caption: caption)
  end 
end
