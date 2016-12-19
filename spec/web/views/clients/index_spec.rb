require 'spec_helper'
require_relative '../../../../apps/web/views/clients/index'

describe Web::Views::Clients::Index do
  let(:exposures) { Hash[clients: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/clients/index.html.slim') }
  let(:view)      { Web::Views::Clients::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #clients' do
    view.clients.must_equal exposures.fetch(:clients)
  end

  describe 'when there are no clients' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no clients</p>')
    end
  end

  describe 'where there are clients' do
    let(:client01) { Client.new(name: 'Client A') }
    let(:client02) { Client.new(name: 'Client B') }
    let(:exposures) { Hash[clients: [client01, client02]] }

    it 'lists them all' do
      rendered.scan(/class="client"/).count.must_equal 2
      rendered.must_include('Client A')
      rendered.must_include('Client B')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no clients</p>')
    end
  end
end
