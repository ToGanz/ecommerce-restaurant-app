require 'rails_helper'

RSpec.describe 'Remove from cart', type: :feature, js: true do

  scenario 'remove prodouct' do
    product = FactoryBot.create(:product)
    add_to_cart(product)
    
    click_on 'Remove'

    expect(page).to have_content("Your current order has a total of: 0")
  end

  def add_to_cart(product)
    visit menu_path
    click_on 'Add to Cart'

    click_on "1 item with a value of #{product.price} €"
  end

end