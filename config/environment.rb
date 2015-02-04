require "rubygems"
require "bundler"

# Load all the default gems:
Bundler.require(:default)

# Load all the environment specific gems:
Bundler.require(Sinatra::Base.environment)

require "active_support/deprecation"
require "active_support/all"

# A fake database:
$db = []

require "./app/todo_api.rb"
