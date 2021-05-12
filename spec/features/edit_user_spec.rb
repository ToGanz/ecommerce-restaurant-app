require 'rails_helper'

RSpec.describe 'edit user', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'valid inputs' do
    sign_in user
    visit root_path
    click_on 'More Info'

    click_on 'Edit Profile'

    fill_in 'user[email]', with: "test@test.com"
    fill_in 'user[current_password]', with: user.password
    click_on 'Update'

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario 'wrong password' do
    sign_in user
    visit edit_user_registration_path

    fill_in 'user[email]', with: "test@test.com"
    fill_in 'user[current_password]', with: "pas"
    click_on 'Update'

    expect(page).to have_content("is invalid")

  end

end