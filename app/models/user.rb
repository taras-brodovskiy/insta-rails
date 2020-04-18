class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

  validates :email, presence: true, length: { minimum: 6, maximum: 255 }

end
