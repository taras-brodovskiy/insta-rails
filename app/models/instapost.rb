class Instapost < ApplicationRecord
  include ImageUploader::Attachment(:image)  

  belongs_to :user

  has_many   :likes,    dependent: :destroy
  has_many   :comments, dependent: :destroy

  validates  :caption, presence: true, length: { maximum: 1000 }

end
