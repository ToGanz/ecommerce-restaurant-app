require 'rails_helper'

RSpec.describe 'Adding to acart', type: :feature do

  scenario 'add a product' do
    product = FactoryBot.create(:product)
    visit menu_path
    click_on 'Add to Cart'

    click_on "1 item with a value of #{product.price} €"

    expect(page).to have_content(product.name)
    expect(page).to have_content("Total: #{product.price}")
  end

end