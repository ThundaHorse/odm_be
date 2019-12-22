class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :posts
  has_many :comments, through: :posts

  def validate_phone(phone)
    regex = /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/
    phone.match(regex) ? true : false
  end 
end