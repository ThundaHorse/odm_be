class PostState < ApplicationRecord
  belongs_to :post

  def upvote
    post_state = PostState.find(self.id)
    post_likes = post_state.likes
    post_likes += 1
    post_state.update(likes: post_likes)
  end 

  def downvote 
    post_state = PostState.find(self.id)
    post_dislikes = post_state.dislikes
    post_dislikes += 1
    post_state.update(dislikes: post_dislikes)
  end 
end
