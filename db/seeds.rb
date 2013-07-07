require 'faker'

User.create({ name: "Ted",
              email: "mr@sauce.com",
              password: "password"})

user = User.create({name: "Groucho",
                    email: "test@test.com",
                    password: "password"})


# post = Post.new
# post.title = Faker::Lorem.words(rand(8) + 1).join(" ")
# post.body = Faker::Lorem.paragraph
# post.user_id = 1
# post.save



  # comment = Comment.new
  # comment.text = Faker::Lorem.words(rand(10)+10).join(" ")
  # comment.post_id = (rand(10)+1)
  # comment.user_id = 2
  # comment.save

post = Post.new
post.title = "My vacation"
post.body = "It was awesome"
post.user_id = 2
post.save

post = Post.new
post.title = "My work"
post.body = "It was amazing"
post.user_id = 1
post.save

comment = Comment.new
comment.text = "It was the funnest!"
comment.post_id = 1
comment.user_id = 1
comment.save