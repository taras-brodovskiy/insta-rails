class Instapost < ApplicationRecord
  include ImageUploader::Attachment(:image)  

  belongs_to :user

  validates :caption, length: { maximum: 1000 }

end
