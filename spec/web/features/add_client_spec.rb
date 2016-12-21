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

      click_button 'Create'
    end

    current_path.must_equal('/clients')
    assert path.has_content?('New Client')
  end
end
