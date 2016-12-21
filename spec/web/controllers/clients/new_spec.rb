require 'spec_helper'
require_relative '../../../../apps/web/controllers/clients/new'

describe Web::Controllers::Clients::New do
  let(:action) { Web::Controllers::Clients::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
