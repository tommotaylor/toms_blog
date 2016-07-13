Fabricator :article do
  title { sequence(:title) { |i| "Article ##{i}" } }
  body { Faker::Lorem.paragraph }
end
