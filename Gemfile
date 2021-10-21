# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "bootsnap", ">= 1.4.2", require: false
gem "jbuilder", "~> 2.10.1"
gem 'pg', '~> 1.2', '>= 1.2.3'
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.4"
gem "rubocop-rails_config", "~> 1.3.3"
gem 'sass-rails', '~> 6.0'
gem 'turbolinks', '~> 5.2', '>= 5.2.1'
gem 'bootstrap', '~> 5.1'
gem 'sprockets', '~> 4.0', '>= 4.0.2'

group :development, :test do
  gem "byebug", "~> 11.1.3"
  gem "factory_bot_rails", "~> 6.1.0"
  gem "faker", "~> 2.14.0"
  gem "rspec-rails", "~> 4.0.1"
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring", "~> 2.1.1"
  gem "spring-watcher-listen", "~> 2.0.0"
end
