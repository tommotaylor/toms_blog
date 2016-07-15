# Toms Blog

This is a sample rails app produced to the following specifications:
- Implement a simple blog system including two models: Post and Comment. 
  - Post model has 2 fields: Title and Body
  - Comment model has 2 fields: User and Body. 
- Create a simple blog system (including post list and post details) where 
users can create comments in post details page.
- Create the Comment feature using AJAX
- In the Posts list page, show the last 3 comments in full belonging to each 
Post. Consider the performance problem this will cause and solve it.
- Create an Article model, this model also has two fields: Title and Body. 
Please create articles list page and article details page. and also, article 
can be commented just like post model.
- Implement a tag system without using gems. And apply this feature to the 
Post and Article form.

## Quick start

```
git clone git@github.com:tommotaylor/toms_blog.git
cd toms_blog
bundle install
```

For testing

```
RAILS_ENV=test bundle exec rake db:migrate:reset
COV=1 bundle exec rspec
```

For development

```
bundle exec rake db:migrate:reset
bundle exec rake db:seed
bundle exec rails s
# open your browser on http://localhost:3000
```

## Dependencies

- Rails 5.0.0
- Ruby 2.3.1
- Postgres

## Testing

Tested using [RSpec](http://rspec.info/) to test the applications. In every
application directory run `rspec` to test that single application.

## Coverage

Run the test suite with the environmental variable `COV=1` eg: `COV=1 rspec` to 
trigger [SimpleCov](https://github.com/colszowka/simplecov) for coverage testing.

## Code Style

Code style enforced using [Rubocop](https://github.com/bbatsov/rubocop) to test
the code base run `cop -D` from the terminal.

## Deploying

The application is hosted on Heroku at: https://desolate-harbor-15469.herokuapp.com/
