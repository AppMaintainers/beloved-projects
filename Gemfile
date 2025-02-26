# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.4.1'
gem 'rails', '~> 7.2.2.1'

gem 'bootsnap', require: false
gem 'devise'
gem 'factory_bot_rails'
gem 'faker'
gem 'inline_svg'
gem 'pg'
gem 'puma'
gem 'pundit'
gem 'shakapacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'erb_lint'
  gem 'rubocop'
  gem 'rubocop-capybara'
  gem 'rubocop-factory_bot'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubocop-rspec_rails'
end

group :test do
  gem 'capybara'
  gem 'pundit-matchers'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
