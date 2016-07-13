source "https://rubygems.org"

gem "rails", "~> 5.0.0"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootstrap-sass", "~> 3.3.6"

group :test do
  gem "simplecov", require: false
  gem "database_cleaner"
  gem "capybara-webkit"
end

group :development, :test do
  gem "rspec-rails"
  gem "fabrication"
  gem "faker"
  gem "pry"
end

group :development do
  gem "rubocop", "0.39.0", require: false
  gem "rubocop-rspec", "1.4.1", require: false
  gem "web-console"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production, :staging do
  gem "rails_12factor"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
