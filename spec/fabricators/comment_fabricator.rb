Fabricator :comment do
  body { sequence(:body) { |i| "Comment ##{i}" } }
  user { Faker::Name.name }
end
