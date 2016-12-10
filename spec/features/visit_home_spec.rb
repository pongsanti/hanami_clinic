require 'features_helper'

describe 'Visit home' do
  it 'is successful' do
    visit '/'

    page.body.must_include('Clinic')
  end

  it 'has link to jquery js file' do
    visit '/'

    page.body.must_include('jquery-3.1.1.js')
  end

  it 'has link to semantic css file' do
    visit '/'

    page.body.must_include('semantic.min.css')
  end

  it 'has link to semantic js file' do
    visit '/'

    page.body.must_include('semantic.min.js')
  end
end
