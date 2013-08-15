source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '3.2.14'
gem 'jquery-rails'
gem 'mongo', '1.8.2'
gem 'bson_ext' # For optimal performance, use of the BSON extension is recommended.
gem "mongo_mapper", github: "alabeduarte/mongomapper" # pretty much same as you
gem 'nokogiri'
gem 'thin'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'pry'
end

group :test do
  gem "rspec", "~> 2.11.0"
  gem "rspec-rails", "~> 2.11.0"
  gem 'rspec-instafail'
  gem 'shoulda-matchers', '~> 1.2'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.2.0'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'terminal-notifier-guard'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'simplecov', :require => false
  gem 'turn', '0.8.2', :require => false
  gem "webrat", "~> 0.7.3"
end

group :production do
  gem 'thin'
end
