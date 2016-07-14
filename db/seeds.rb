10.times { Fabricate :post }
10.times { Fabricate :article }

tags = ["film", "news", "music", "art", "sport"]
tags.each do |tag|
  Tag.create(name: tag)
end
