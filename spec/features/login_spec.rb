require 'rails_helper'

RSpec.describe 'login user', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'valid inputs' do
    visit root_path
    click_on 'More Info'
    
    click_on 'Log in'

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log in'
    
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'invalid inputs' do
    visit root_path
    click_on 'More Info'
    
    click_on 'Log in'

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'pw'
    click_on 'Log in'
    
    expect(page).to have_content('Invalid Email or password')
  end
end