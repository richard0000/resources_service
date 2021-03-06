# frozen_string_literal: true

require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../router.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def
    app() Sinatra::Application
  end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }
