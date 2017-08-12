json.(post, :id, :title, :content, :likes)

json.image do
  json.src post.image
  json.alt post.title
end

json.details do
  json.author post.author
  json.createdAt post.created_at
  json.updatedAt post.updated_at
end
