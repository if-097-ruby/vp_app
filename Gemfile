source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails',            '~> 5.2.3'
gem 'pg',               '>= 0.18', '< 2.0'
gem 'puma',             '~> 3.11'
gem 'sass-rails',       ' ~> 5.0'
gem 'haml-rails',       '1.0.0'
gem 'uglifier',         '>= 1.3.0'
gem 'webpacker',        "4.0.2"
gem 'react_on_rails',   '11.1.4'
gem 'bootstrap',        '~> 4.3.1'
gem 'jquery-rails'
gem 'sprockets-rails',  '2.3.3'
gem 'coffee-rails',     '~> 4.2'
gem 'turbolinks',       '~> 5'
gem 'jbuilder',         '~> 2.5'
gem 'bootsnap',         '>= 1.1.0', require: false

group :development, :test do
  gem 'rspec-rails',    '~> 3.8'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',    '>= 3.3.0'
  gem 'listen',         '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara',       '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'simplecov', require: false
  gem 'simplecov-rcov'

end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]