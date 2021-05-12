require 'rails_helper'

RSpec.describe 'Update product', type: :feature do

  scenario 'not logged in' do
    product = FactoryBot.create(:product)
    visit products_path
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'valid inputs' do
    product = FactoryBot.create(:product)
    sign_up_as_admin

    visit products_path
    click_on 'Edit'

    fill_in 'Name', with: "Jason's Filthy Steak"
    click_on 'Update Product'
    expect(page).to have_content("Jason's Filthy Steak")
  end


end