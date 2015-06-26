source 'https://rubygems.org'
gem 'rails', '4.2.1'
gem 'rails-api', '~> 0.4.0'
gem 'active_model_serializers', '~> 0.8.3' # NOTE: not the 0.9
gem 'devise', '~> 3.4.1'
gem 'tzinfo-data'
gem 'faker'

# To use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'mysql2'
  gem 'rspec-rails', '~> 2.0'
  gem 'capybara'
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails', '~> 4.0'
 
end

group :test do
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
end