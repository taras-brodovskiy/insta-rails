class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :instapost

  validates  :caption, presence: true, length: { maximum: 1000 }
end
