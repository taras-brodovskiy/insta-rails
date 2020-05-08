class Instapost < ApplicationRecord
  include ImageUploader::Attachment(:image)  

  belongs_to :user

  has_many   :likes

  validates :caption, length: { maximum: 1000 }

end
