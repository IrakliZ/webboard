source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '3.0.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# gem for password encryption
gem 'bcrypt-ruby', '3.1.2'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Required to list only some number of users or boards
gem 'will_paginate-bootstrap'
gem 'bootstrap-will_paginate', '0.0.9'

gem 'faker', '1.1.2'

group :doc do
 	 # bundle exec rake doc:rails generates the API under doc/api.
  	gem 'sdoc', require: false
end

group :development, :test do
  	gem 'rspec-rails', '2.13.1'
  	gem 'sqlite3'
end

group :production do
  gem 'pg'
end

group :test do
	gem 'factory_girl_rails', '4.2.1'
	gem 'cucumber-rails', :require=>false
	gem 'capybara', '2.1.0'
	gem 'database_cleaner'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
