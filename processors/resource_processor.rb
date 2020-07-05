require 'sinatra'
require_relative "../providers/caching_service"

###
# @description This class represents (as a sort of template method design pattern)
#   a way to let this service servee resources from different sources.
#   So in this class we will require a concrete gateway to ask for the resources
###
class ResourceProcessor
  ###
  # @description Initialize the resource processor class with the necessar data (using dependency injection)
  # @param [Hash] params The data this processor will use in order to work.
  #   Must include the gateway which will fetch the resources
  ###
  def initialize params = {}
    raise 'Must include a gateway in order to use ResourceProcessor' if params[:gateway].nil?

    @gateway = params[:gateway]
    @caching_service = CachingService.new
  end

  ###
  # @description Fetches all the resources
  # @return [String] A collection of resources
  ###
  def fetch
    # @todo: Before asking the gateway, that connects to the CR service, we could:
    #   - Ask if we have any results in DB (maybe invalidate per date?) to the model (not yet implemented)
    #   - If we have data in DB and it's still valid (let's say stored as max a week ago)
    #     we return that data.
    #   - If we don't have data in DB, then we fetch from gateway
    #   - And then return and maybe store to the DB in parallel or in a job

    # Return cached resources, if any
    if !((resources = @caching_service.read("resources")).nil?)
      return resources
    end

    # By now (see @todo above), only fecth from RC API when there's nothing in cache
    resources = @gateway.fetch_all

    # If we hit the RC API, let's write in cache to get quicker reults next request
    # (between the next couple of minutes, before cache expires)
    @caching_service.write("resources", resources)

    # Return the resources fetched from the RC API
    resources
  end
end
