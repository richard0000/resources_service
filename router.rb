# frozen_string_literal: true

require 'sinatra'
require 'sinatra/namespace'
require_relative 'controllers/resources_controller'

# Set 0.0.0.0 instead of 127.0.0.1 to make the service available outside the container
set :bind, '0.0.0.0'

before do
  content_type :json
end

###
# @description: Root point of the application. Following HATEOAS,
#   we add hypermedia to the API to make it easier to follow
# @see https://en.wikipedia.org/wiki/HATEOAS
###
get '/' do
  'Welcome! Try GET http://localhost:4567/api/v1/resources'
end

###
# @description: All the endpoints for the first version of the resources service API
###
namespace '/api/v1' do
  get '/resources' do
    ResourcesController.index
  end
end
