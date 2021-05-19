require 'rails_helper'

RSpec.describe 'Adding to cart', type: :feature, js: true do

  scenario 'add a product' do
    product = FactoryBot.create(:product)
    visit menu_path
    click_on 'Add to Cart'

    within('#cart') do
      click_on "1"
    end
  
    expect(page).to have_content(product.name)
    expect(page).to have_content("€ #{product.price}")
  end

end