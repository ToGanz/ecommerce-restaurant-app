require 'rails_helper'

RSpec.describe 'Update cart', type: :feature, js: true do

  scenario 'change quantity' do
    product = FactoryBot.create(:product)
    add_to_cart(product)
    fill_in 'line_item[quantity]', with: 2
    
    click_on 'Update'

    expect(page).to have_content("€ #{product.price * 2}")
  end

  def add_to_cart(product)
    visit menu_path
    click_on 'Add to Cart'

    within('#cart') do
      click_on "1"
    end
  end

end