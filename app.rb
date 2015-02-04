
require 'bundler/setup'
require 'sinatra'
require 'sinatra/base'
require 'active_support/all'

module MyService
  class App < Sinatra::Application
    before do
      content_type :json
    end

    # Of course, we must:
    get '/' do
      {hello: :world, foo: [:bar, :baz, :bux]}.to_json
    end
  end
end

MyService::App.run!
