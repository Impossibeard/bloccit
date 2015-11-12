include RandomData

#Create posts
50.times do
  Post.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end

posts = Post.all

uniqpost = Post.find_or_create_by(
title: "I am a Uniq Title!",
body: "I am a Uniq Body!"
)

#Create comments

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

uniqcomment = Comment.find_or_create_by(
post: uniqpost,
body: "I am a Uniq Comment Body!"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
