class Comment < ApplicationRecord
  belongs_to :post
  
  def upvote
    comment = Comment.find(self.id)    
    current_likes = comment.likes
    current_likes += 1
    comment.update(likes: current_likes)
  end 

  def downvote
    comment = Comment.find(self.id)
    current_dislikes = comment.dislikes
    current_dislikes += 1
    comment.update(dislikes: current_dislikes)
  end

  def poster 
    comment = Comment.find(self.id)
    user = User.find(comment.user_id)
    user.first_name
  end 
end
