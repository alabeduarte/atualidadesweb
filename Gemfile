source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'mongo', '1.5.2'
gem 'bson', '1.5.2'
gem 'bson_ext', '1.5.2'
gem "mongo_mapper", github: "jnunemaker/mongomapper" # pretty much same as you
# gem 'devise', '2.0.0'
# gem 'mm-devise'
gem 'cancan'
gem 'newly', '1.1.0'
gem 'thin'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
    gem "rspec-rails", "~> 2.5.0"
    gem "webrat", "~> 0.7.3"
    gem 'database_cleaner'
end

group :test do
  gem 'factory_girl_rails', '~> 1.7.0'
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end

group :production do
  gem 'thin'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
