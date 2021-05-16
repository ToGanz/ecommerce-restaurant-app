require 'rails_helper'

RSpec.describe 'Adding to cart', type: :feature, js: true do

  scenario 'add a product' do
    product = FactoryBot.create(:product)
    add_to_cart(product)
    fill_in 'line_item[quantity]', with: 2
    
    click_on 'Update'

    expect(page).to have_content("2")
    expect(page).to have_content("Your current order has a total of: #{product.price * 2}")
  end

  def add_to_cart(product)
    visit menu_path
    click_on 'Add to Cart'

    click_on "1 item with a value of #{product.price} €"
  end

end