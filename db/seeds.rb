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

users.each do |user|
  10.times do
    caption = Faker::Movies::LordOfTheRings.quote
    Instapost.create!(caption: caption, user: user)
  end
end
