source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Deploy with Capistrano
gem 'capistrano', '~> 3.5.0'
gem 'capistrano-rails', '~> 1.1.7'
gem 'capistrano-rbenv', '~> 2.0.4'
gem 'capistrano-bundler', '~> 1.1.3'

gem 'newrelic_rpm', '3.16.0.318'

#gem 'curation_concerns', '~> 1.6.1'
gem 'curation_concerns', github:'projecthydra-labs/curation_concerns', branch: :member_of_replace
gem 'active-fedora', '11.0.0.rc7'
gem 'rsolr', '~> 1.0'
gem 'devise', '~> 3.5.10'
gem 'devise-guests', '~> 0.5'
gem 'blacklight-gallery'
gem 'factory_girl', '~> 4.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'simplecov', '~> 0.11.2'
  gem 'capybara', '~> 2.6.0'
  gem 'rails_autolink', '~> 1.1.6'
  gem 'rspec-rails', '3.5.0'
  gem 'rspec-activemodel-mocks', '~> 1.0'
  gem 'rspec-mocks', '3.5.0'
  gem 'unicorn', '~> 5.1.0'
  gem 'factory_girl_rails', '~> 4.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


group :development, :test do
  gem 'solr_wrapper', '>= 0.3'
  gem 'fcrepo_wrapper'
end

