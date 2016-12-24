require 'spec_helper'
require_relative '../../../../apps/web/views/clients/new'

class NewClientParams < Hanami::Action::Params
  params do
    required(:client).schema do
      required(:name).filled(:str?)
      required(:email).filled(:str?)
    end
  end
end

describe Web::Views::Clients::New do
  let(:params)    { NewClientParams.new(client: {}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/clients/new.html.erb') }
  let(:view)      { Web::Views::Clients::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contain errors' do
    params.valid?

    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Name is missing')
    rendered.must_include('Email is missing')
  end
end
