require 'rails_helper'

RSpec.describe 'Creating a product', type: :feature do
  scenario 'not logged in' do
    visit new_product_path
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'logged in as normal user' do
    sign_in(FactoryBot.create(:user))
    visit new_product_path
    expect(page).to have_current_path(root_path)
  end

  scenario 'admin user with valid inputs but no category present' do
    sign_up_as_admin

    visit new_product_path
    expect(page).to have_current_path(new_category_path)
  end

  scenario 'admin user with valid inputs and category' do
    sign_up_as_admin

    visit new_category_path
    fill_in 'Name', with: 'Pizza'
    fill_in 'Description', with: 'Italian'
    click_on 'Create Category'

    visit new_product_path
    fill_in 'Name', with: 'Salami'
    fill_in 'Description', with: 'Hungarian Salami'
    select('Pizza', :from => 'product[category_id]')
  
    click_on 'Create Product'

    expect(page).to have_content("Salami")
    expect(page).to have_content("Hungarian Salami")
    expect(page).to have_content("Pizza")
  end

  scenario 'invalid inputs' do
    sign_up_as_admin

    visit new_category_path
    fill_in 'Name', with: 'Pizza'
    fill_in 'Description', with: 'Italian'
    click_on 'Create Category'
    
    visit new_product_path
    fill_in 'Name', with: ''
    fill_in 'Description', with: 'Burger with cheese'
    fill_in 'Price', with: 9.99
    click_on 'Create Product'

    expect(page).to have_content("Name can't be blank")
  end

end