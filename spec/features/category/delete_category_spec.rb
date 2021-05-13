require 'rails_helper'

RSpec.describe 'Delete product', type: :feature do

  scenario 'as admin valid inputs' do
    sign_up_as_admin
    product = FactoryBot.create(:product)

    visit products_path
    expect(page).to have_content(product.name)
    click_on 'Destroy'

    expect(page).not_to have_content(product.name)
  end
end