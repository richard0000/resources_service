# frozen_string_literal: true

# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'Resources Service' do
  it 'Should welcome the user at root point' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response).to match('Welcome!')
  end

  it 'Should list all the resources at /api/v1/resources' do
    get '/api/v1/resources'
    expect(last_response).to be_ok
    # String taken from the (CR resources public api endpoint)[https://staging.credentialengineregistry.org/envelopes]
    expect(last_response.body).to include('envelope_community')
  end
end

# Tests for the Decoder layer. This is not included in this 8 hours work,
# but useful to have it as a reminder of what's next
describe 'Decoder' do
  it 'Should correctly decode a resource' do
  end

  it 'The JWT resource field was encoded by the public key provided in the envelope' do
  end
end

# Tests for a single resource (when it's already in the DB -not scoped
# in this 8 hours work, but useful to have as a 'must include' test)
describe 'Resource' do
  # Validate the most important field inside the JWT (when it's decoded)
  it 'Should contain a <field> attribute' do
  end
end
