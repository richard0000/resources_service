# frozen_string_literal: true

require 'json'

###
# @description This class will provide a way of making the raw resources from CR
#   readable.
#
# @todo This layer should include JWT in the future to decode every resource
###
class ResourceDecoder
  ###
  # @description: Initilalize this resource decoder instance
  # @param [Hash] params
  ###
  def initialize(params = {})
    @resources_list = params[:resources_list]
  end

  ###
  # @description Works with a colelction of encoded resources to decode it
  # @return [String] The decoded collection of resources
  ###
  def decode_resources
    resources = []

    @resources_list.each { |r| resources << r['decoded_resource'] }

    resources.to_json
  end
end
