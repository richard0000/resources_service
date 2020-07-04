require 'sinatra'
require 'sinatra/namespace'
require_relative "processors/resource_processor"
require_relative "gateways/credential_registry_gateway"

before do
  content_type :json
end

###
# @description: Root point of the application. Following HATEOAS, 
#   we add hypermedia to the API to make it easier to follow
# @see https://en.wikipedia.org/wiki/HATEOAS
###
get '/' do
  "Welcome! Try GET http://localhost:4567/api/v1/resources"
end

###
# @description: All the endpoints for the first version of the resources service API
###
namespace '/api/v1' do
  get '/resources' do
    gateway = CredentialRegistryGateway.new
    processor = ResourceProcessor.new({:gateway => gateway})

    processor.fetch
  end
end