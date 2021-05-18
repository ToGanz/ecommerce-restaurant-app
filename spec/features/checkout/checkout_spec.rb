require 'rails_helper'

RSpec.describe 'Checkout', type: :feature, js: true do

  scenario 'complete address' do
    product = FactoryBot.create(:product)
    add_to_cart(product)
  
    click_on 'Buy'

    fill_in 'Street, no.', with: 'Randostreet, 2'
    fill_in 'City', with: 'Duisburg'
    fill_in 'Zip', with: '47051'
    click_on 'Confirm Order'

    expect(page).to have_content("Randostreet, 2")
    expect(page).to have_content("47051 Duisburg")
  end

  def add_to_cart(product)
    visit menu_path
    click_on 'Add to Cart'

    click_on "1 item with a value of #{product.price} €"
  end

end