json.id post.id
json.user_id post.user_id
json.description post.description
json.poster post.user.first_name
json.image_url rails_blob_url(post.image) if post.image.attachment