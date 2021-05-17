require 'rails_helper'

RSpec.describe 'Checkout', type: :feature, js: true do

  scenario 'change quantity' do
    product = FactoryBot.create(:product)
    add_to_cart(product)
  
    click_on 'Buy'

    expect(page).to have_content("2")
    expect(page).to have_content("Your current order has a total of: #{product.price * 2}")
  end

  def add_to_cart(product)
    visit menu_path
    click_on 'Add to Cart'

    click_on "1 item with a value of #{product.price} €"
  end

end