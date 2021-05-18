require 'rails_helper'

RSpec.describe 'Delete order', type: :feature do

  scenario 'as admin valid inputs' do
    order = FactoryBot.create(:order, paid: true, total: 10.0)
    FactoryBot.create(:line_item, order: order)

    sign_up_as_admin

    visit orders_path

    expect(page).to have_content(order.total)
    click_on 'Destroy'

    expect(page).not_to have_content(order.total)
  end
end