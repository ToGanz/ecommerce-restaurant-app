require 'rails_helper'

RSpec.describe 'Visiting the admin panel', type: :feature do
  scenario 'not logged in' do
    visit admin_path
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'logged in as normal user' do
    sign_in(FactoryBot.create(:user))
    visit admin_path
    expect(page).to have_current_path(root_path)
  end

  scenario 'admin user' do
    sign_up_as_admin

    visit admin_path

    expect(page).to have_content('Products')
  end
end