# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'jbuilder', '~> 2.11'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.4'
gem 'rails', '~> 6.1.4'
gem 'sassc-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.4'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'bcrypt'
gem 'date_validator'
gem 'kaminari'
gem 'nokogiri'
gem 'rails-i18n'
gem 'valid_email2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'debase'
  gem 'listen', '>= 3.0.5', '< 3.8'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'ruby-debug-ide'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
