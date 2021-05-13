require 'rails_helper'

RSpec.describe 'Creating a category', type: :feature do
  scenario 'not logged in' do
    visit new_category_path
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'logged in as normal user' do
    sign_in(FactoryBot.create(:user))
    visit new_category_path
    expect(page).to have_current_path(root_path)
  end

  scenario 'admin user with valid inputs' do
    sign_up_as_admin

    visit new_category_path
    fill_in 'Name', with: 'Pizza'
    fill_in 'Description', with: 'Italian'
    click_on 'Create Category'

    visit categories_path
    expect(page).to have_content("Pizza")
    expect(page).to have_content("Italian")
  end

  scenario 'invalid inputs' do
    sign_up_as_admin
    visit new_category_path
    fill_in 'Name', with: ''
    fill_in 'Description', with: 'Italian'
    click_on 'Create Category'

    expect(page).to have_content("Name can't be blank")
  end

end