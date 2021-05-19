require 'rails_helper'

RSpec.describe 'Remove from cart', type: :feature, js: true do

  scenario 'remove prodouct' do
    product = FactoryBot.create(:product)
    add_to_cart(product)
    
    find(".ri-delete-bin-3-line").click

    expect(page).to have_content("€ 0")
  end

  def add_to_cart(product)
    visit menu_path
    click_on 'Add to Cart'

    click_on "1 item with a value of #{product.price} €"
  end

end