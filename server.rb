require 'sinatra'
require 'sinatra/namespace'
require_relative "processors/resource_processor"

before do
  content_type :json
end

###
# @description: Root point of the application.
###
get '/' do
  "Welcome!"
end