# frozen_string_literal: true

require 'redis'

###
# @description: Manages to encapsulate the caching mechanism, in order to get the
#   ability, as a system, to change it if necessary
###
class CachingService
  ###
  # @description: Initializes the caching tool (redis ni this case)
  ###
  def initialize
    # Configure redis
    @redis = Redis.new(host: ENV['REDIS_PORT_6379_TCP_ADDR'], port: ENV['REDIS_PORT_6379_TCP_PORT'])
  end

  ###
  # @description: Fetch a value from cache using a key
  # @param [String] key
  # @return [String|nil] The value we are looking for
  ###
  def read(key)
    @redis.get(key)
  end

  ###
  # @description: Writes a value in cache using a
  # @param [String] key The key to identify the value we are going to write into cache.
  #   So when we want to fetch it from cahce we use this key.
  # @param [String] value The value to write into the cache
  # @param [Fixnum] expires The amount of seconds this value will be present in cache
  # @return [Boolean] Whether it was able to write to cache or not
  ###
  def write(key, value, expire_at = 600)
    @redis.set(key, value)
    @redis.expire(key, expire_at)
  end
end
