class Instapost < ApplicationRecord
  
  belongs_to :user

  validates :caption, length: { maximum: 1000 }

end
