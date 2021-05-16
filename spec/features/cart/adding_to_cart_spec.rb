require 'rails_helper'

RSpec.describe 'Adding to acart', type: :feature do
  let(:product) { FactoryBot.create(:product) }

  scenario 'add a product' do
    visit menu_path
    click_on 'Add to Cart'
    click_on 'View Cart'

    expect(page).to have_content(product.name)
    expect(page).to have_content("Total: #{product.price}")
  end

end