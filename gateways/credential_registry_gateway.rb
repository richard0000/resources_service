# frozen_string_literal: true

require 'sinatra'
require 'httparty'
require_relative '../providers/resource_decoder'

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
    @endpoint = '/envelopes'
  end

  ###
  # @description This method connects to the RC API and gets all the resources
  # @return [String] a collection of resources
  ###
  def fetch_all
    begin
      response = self.class.get(@endpoint)

      decoder = ResourceDecoder.new({ resources_list: JSON.parse(response.body) })

      # Just pass the response as we can connect to RC API, as an MVP
      # @todo: before returning parse the response to decode, store in DB
      decoder.decode_resources
    rescue => e
      "An error has occurred \n DETAILS:\n #{e}"
    end
  end
end
