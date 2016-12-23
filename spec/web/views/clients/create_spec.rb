require 'spec_helper'
require_relative '../../../../apps/web/views/clients/create'

describe Web::Views::Clients::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/clients/create.html.erb') }
  let(:view)      { Web::Views::Clients::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
