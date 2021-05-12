require "rails_helper"

RSpec.feature "logout user", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'user successfully logs out' do
    sign_in user
    visit root_path
    click_on 'More Info'
    
    click_on 'Log out'
        
    expect(page).to have_content('Signed out successfully')
  end

end