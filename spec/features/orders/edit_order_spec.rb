require 'rails_helper'

RSpec.describe 'Update order', type: :feature do
  
  scenario 'not logged in' do
    order = FactoryBot.create(:order)
    FactoryBot.create(:line_item, order: order)
    visit orders_path
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'valid inputs' do
    order = FactoryBot.create(:order)
    FactoryBot.create(:line_item, order: order)

    sign_up_as_admin

    orders_path
    click_on 'Edit'

    fill_in 'City', with: 'Hamburg'
    click_on 'Update Order'
    expect(page).to have_content('Hamburg')
  end


end