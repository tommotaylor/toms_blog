tags = ["film", "news", "music", "art", "sport"]
tags.each do |tag|
  Tag.create(name: tag)
end

10.times do
  tags = Tag.all.sample(2)
  post = Fabricate :post
  post.tags << tags
  5.times { Fabricate :comment, commentable: post }
end

10.times do
  tags = Tag.all.sample(2)
  article = Fabricate :article
  article.tags << tags
  5.times { Fabricate :comment, commentable: article }
end

