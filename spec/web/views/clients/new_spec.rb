require 'spec_helper'
require_relative '../../../../apps/web/views/clients/new'

describe Web::Views::Clients::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/clients/new.html.erb') }
  let(:view)      { Web::Views::Clients::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
