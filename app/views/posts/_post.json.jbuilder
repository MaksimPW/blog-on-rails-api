json.(post, :id, :title, :content, :likes)

json.image do
  json.src "http://#{request.host_with_port}#{post.image}"
  json.alt post.title
end

json.details do
  json.author post.author
  json.createdAt post.created_at.strftime("%d %b %Y")
  json.updatedAt post.updated_at.strftime("%d %b %Y")
end
