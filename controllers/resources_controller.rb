# frozen_string_literal: true

require_relative '../processors/resource_processor'
require_relative '../gateways/credential_registry_gateway'
###
# @description: Wrap all the controller actions related with resources
###
class ResourcesController
  ###
  # @description: List all the resources from RC API
  # @return [String] The JSON response corresponding to the requested resources collection
  ###
  def self.index
    gateway = CredentialRegistryGateway.new
    processor = ResourceProcessor.new({ gateway: gateway })
    processor.fetch
  end
end
