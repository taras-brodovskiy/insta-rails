source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails',  '6.0.2.2'

gem 'devise', '~> 4.7'
gem 'pg',     '~> 1.2'
gem 'puma',   '~> 4.3'

gem 'bootstrap-sass', '~> 3.4'
gem 'jquery-rails',   '~> 4.3'
gem 'sass-rails',     '~> 6.0'
gem 'sprockets',      '4.0.0'
gem 'will_paginate'

gem 'faker'

group :development do
  gem 'byebug',                '~> 11.1'
  gem 'web-console',           '3.7.0'
  gem 'listen',                '~> 3.2'
  gem 'spring',                '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test, :development do
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails', '~> 5.1.1'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'rails-controller-testing'
end

gem 'tzinfo-data'
