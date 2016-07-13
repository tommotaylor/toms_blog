Fabricator :post do
  title { sequence(:title) { |i| "Post ##{i}" } }
  body { Faker::Lorem.paragraph }
end
