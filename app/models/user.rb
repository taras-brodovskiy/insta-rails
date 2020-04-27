class User < ApplicationRecord
  
  has_many :instaposts, dependent: :destroy

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships,  source: :followed
  
  has_many :followers, through: :passive_relationships, source: :follower


  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  before_save :downcase_email

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

  validates :email, presence: true, length: { minimum: 6, maximum: 255 }


  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  private

    def downcase_email
      self.email = email.downcase
    end
end
