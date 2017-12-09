source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'

gem 'coffee-rails'
gem 'dotenv-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'sorcery'
gem 'turbolinks'
gem 'uglifier'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'pry'
  gem 'selenium-webdriver'
end

group :development do
  gem 'annotate'
  gem 'listen'
  gem 'spring-watcher-listen'
  gem 'spring'
  gem 'web-console'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
