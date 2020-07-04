# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'Resources Service' do
  it 'Should welcome the user at root point' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response).to match('Welcome!')
  end

  it 'shoul list all the resources at /api/v1/resources' do
    get '/api/v1/resources'
    expect(last_response).to be_ok
    # String taken from the (CR resources public api endpoint)[https://staging.credentialengineregistry.org/envelopes]
    expect(last_response.body).to include('envelope_community')
  end
end
