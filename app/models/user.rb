class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :posts

  # def user_posts 
  #   Post.where(user_id: self.id)
  # end 
end