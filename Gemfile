# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.2'
gem 'rails', '~> 6.1.4'

gem 'bootsnap', require: false
gem 'devise'
gem 'factory_bot_rails'
gem 'faker'
gem 'font-awesome-rails'
gem 'font-awesome-sass'
gem 'inline_svg'
gem 'pg'
gem 'puma'
gem 'pundit'
gem 'sass-rails'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'shakapacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'erb_lint'
  gem 'rubocop'
  gem 'rubocop-capybara'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :test do
  gem 'capybara'
  gem 'pundit-matchers'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'warden'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
