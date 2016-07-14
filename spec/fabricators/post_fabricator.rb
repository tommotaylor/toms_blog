Fabricator :post do
  title { sequence(:title) { |i| "Post ##{i}" } }
  body { Faker::Lorem.paragraphs(4).join("") }
end
