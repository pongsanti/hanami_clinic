require_relative '../../features_helper'

describe 'Add a client' do
  after do
    ClientRepository.new.clear
  end

  it 'can create a new client' do
    visit '/clients/new'

    within 'form#client-form' do
      fill_in 'Name', with: 'New Client'
      fill_in 'Email', with: 'client01@gmail.com'

      click_button 'Create Client'
    end

    current_path.must_equal('/clients')
    assert page.has_content?('New Client')
  end

  it 'displays list of errors when params contain errors' do
    visit '/clients/new'

    within 'form#client-form' do
      click_button 'Create Client'
    end

    current_path.must_equal('/clients')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Name must be filled')
    assert page.has_content?('Email must be filled')
  end
end
