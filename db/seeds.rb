[User, Post, Comment].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end


lauren = User.create!(username: "lauren", first_name: "Lauren", last_name: "Armbrüst")
alex = User.create!(username: "alex", first_name: "Alex", last_name: "Okamoto")
jack = User.create!(username: "jack", first_name: "Jack", last_name: "Ass")

alex.friend_request(lauren)
lauren.accept_request(alex)

jack.friend_request(lauren)
lauren.accept_request(jack)

jack.friend_request(alex)
alex.accept_request(jack)

posts = Post.create!([
  {headline: "AAAAAAA", src: "bbc-news", categories: "Politics", description: "This is bomb.", user: lauren},
  {headline: "Woot Woot", src: "buzzfeed", categories: "Pop Culture", description: "I can't believe it.", user: alex},
  {headline: "Cash me out", src: "daily-mail", categories: "Pop Culture", description: "Damn.", user: jack}
  ])

Comment.create!([
  {user: alex, post: posts[0], body: "what's dis"},
  {user: lauren, post: posts[2], body: "cool"},
  {user: jack, post: posts[1], body: "hello"}
  ])
