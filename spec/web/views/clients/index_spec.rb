require 'spec_helper'
require_relative '../../../../apps/web/views/clients/index'

describe Web::Views::Clients::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/clients/index.html.erb') }
  let(:view)      { Web::Views::Clients::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
