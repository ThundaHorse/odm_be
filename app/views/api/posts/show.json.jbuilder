json.id @post.id 
json.user_id @post.user_id
json.description @post.description
json.poster @post.user.first_name
json.comments @post.comments
json.post_state @post.post_state
json.likes @post.total_likes
json.dislikes @post.total_dislikes
json.image_url rails_blob_url(@post.image) if @post.image.attachment