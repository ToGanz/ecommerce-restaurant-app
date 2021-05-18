require 'rails_helper'

RSpec.describe 'show orders', type: :feature do
  
  scenario 'not logged in' do
    order = FactoryBot.create(:order)
    FactoryBot.create(:line_item, order: order)
    visit orders_path
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'display only paid, undelivered and uncanceled orders' do
    order1 = FactoryBot.create(:order, paid: true, total: 1.0)
    FactoryBot.create(:line_item, order: order1)
    order2 = FactoryBot.create(:order, paid: false, total: 2.0)
    FactoryBot.create(:line_item, order: order2)
    order3 = FactoryBot.create(:order, paid: true, delivered: true, total: 3.0)
    FactoryBot.create(:line_item, order: order3)
    order4 = FactoryBot.create(:order, paid: true, canceled: true, total: 4.0)
    FactoryBot.create(:line_item, order: order4)

    sign_up_as_admin

    visit orders_path
  
    expect(page).to have_content('1.0')
    expect(page).not_to have_content('2.0')
    expect(page).not_to have_content('3.0')
    expect(page).not_to have_content('4.0')
  end
end