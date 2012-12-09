source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'mysql2'
gem 'capistrano'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails'
end

gem 'jquery-rails'

group :development, :test do
  gem 'ruby-prof'
  gem 'guard-rspec'
  gem 'rspec-rails', '~> 2.6'
  gem 'capybara'
  gem 'factory_girl'
end

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
