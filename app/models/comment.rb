class Comment < ApplicationRecord
  belongs_to :post
  
  def formatted_time
    updated_at.getlocal.localtime.strftime('%m/%d/%Y  %I:%M %p')
  end 

  def poster 
    comment = Comment.find(self.id)
    user = User.find(comment.user_id)
    user.first_name
  end 
end
