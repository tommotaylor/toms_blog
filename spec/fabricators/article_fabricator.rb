Fabricator :article do
  title { sequence(:title) { |i| "Article ##{i}" } }
  body { Faker::Lorem.paragraphs(6).join("") }
end
