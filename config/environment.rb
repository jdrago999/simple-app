require "rubygems"
require "bundler"

# load all the default gems
Bundler.require(:default)
# load all the environment specific gems
Bundler.require(Sinatra::Base.environment)

require "active_support/deprecation"
require "active_support/all"

$db = []