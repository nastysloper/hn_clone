require 'faker'

# User.create({ name: "Ted",
#               email: "mrawesome@sauce.com",
#               password: "password"})

user = User.create({name: "Groucho",
                    email: "test@test.com",
                    password: "password"})

# 10.times do
#   post = Post.new
#   post.title = Faker::Lorem.words(rand(8) + 1).join(" ")
#   post.body = Faker::Lorem.paragraph
#   post.user_id = 1
#   post.save
# end

30.times do
  comment = Comment.new
  comment.text = Faker::Lorem.words(rand(10)+10).join(" ")
  comment.post_id = (rand(10)+1)
  comment.user_id = 2
  comment.save
end
