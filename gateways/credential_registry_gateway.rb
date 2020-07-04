require 'sinatra'
require 'httparty'

###
# @description: This class will connect to CredentialRegistry to get resources
###
class CredentialRegistryGateway
  include HTTParty
  base_uri 'https://staging.credentialengineregistry.org'

  ###
  # @description Initializes the gateway class with the necessary data to operate
  ###
  def initialize
    @endpoint = "/envelopes"
  end

  ###
  # @description This method connects to the RC API and gets all the resources
  # @return [String] a collection of resources 
  ###
  def fetchAll
    begin
      response = self.class.get(@endpoint)

      # Just pass the response as we can connect to RC API, as an MVP
      # @todo: before returning parse the response to decode, store in DB
      return response.body.to_s
    rescue => e
      "An error has occurred \n DETAILS:\n #{e}"
    end
  end
end