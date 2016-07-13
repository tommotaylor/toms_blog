ENV["RAILS_ENV"] ||= "test"
require "simplecov" if ENV["COV"]
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"

Dir[Rails.root.join("support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Rails.logger.level = 4

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Capybara::DSL
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before :suite do
    Capybara.javascript_driver = :webkit
    Capybara.default_max_wait_time = 2
  end

  config.before do
    DatabaseCleaner.strategy = :transaction
  end

  config.before js: true do
    DatabaseCleaner.strategy = :truncation
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.after :all do
    DatabaseCleaner.clean_with :truncation
  end
end
