class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_many :post_states

  def total_likes
    sum = 0
    stats = PostState.where(post_id: self.id)    
    stats.each { |i| sum += i.likes }
    sum
  end 

  def total_dislikes 
    sum = 0 
    stats = PostState.where(post_id: self.id)
    stats.each { |i| sum += i.dislikes }
    sum
  end 
end