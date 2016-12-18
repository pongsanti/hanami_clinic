require_relative '../features_helper'

describe 'List clients' do
  let(:repository) { ClientRepository.new }
  before do
    repository.clear

    repository.create(name: 'client01', email: 'john@clinic01.com')
    repository.create(name: 'client02', email: 'john@clinic02.com')
  end

  it 'displays each client on the page' do
    visit '/clients'

    within '#clients' do
      assert page.has_css?('.client', count: 2)
    end
  end
end
