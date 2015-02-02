
source 'https://rubygems.org'

gem 'sinatra'
gem 'activesupport', require: 'active_support'
gem 'puma'

gem 'dotenv'
gem 'dotenv-deployment'

group :development, :test do
  gem 'pry'
  gem 'shotgun' # Auto-reload sinatra app on change.
  gem 'better_errors' # Show an awesome console in the browser on error.
  gem 'rest-client'
end

group :test do
  gem "codeclimate-test-reporter", require: nil
  gem 'rspec'
  gem 'rack-test'
  gem 'guard-rspec'
  gem 'shoulda'
  gem 'json_spec'
  gem 'webmock'
end

