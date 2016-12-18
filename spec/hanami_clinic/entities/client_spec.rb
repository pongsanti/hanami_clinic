require_relative '../../spec_helper'

describe Client do
  it 'can be initialised with attributes' do
    client = Client.new(name: 'A client')
    client.name.must_equal 'A client'
  end
end
