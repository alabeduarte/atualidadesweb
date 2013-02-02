source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'mongo', '1.8.1'
gem 'bson', '1.8.1'
gem 'bson_ext', '1.8.1'
gem "mongo_mapper", github: "jnunemaker/mongomapper" # pretty much same as you
gem 'nokogiri'
gem 'thin'
gem 'heroku'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem "rspec-rails", "~> 2.5.0"
  gem "webrat", "~> 0.7.3"
  gem 'database_cleaner'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'rb-fsevent', '~> 0.9.1'
end

group :test do
  gem 'simplecov', :require => false
  gem 'factory_girl_rails', '~> 1.7.0'
  gem 'turn', '0.8.2', :require => false
end

group :production do
  gem 'thin'
end
