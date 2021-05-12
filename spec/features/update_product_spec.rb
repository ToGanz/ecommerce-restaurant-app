require 'rails_helper'

RSpec.describe 'Update product', type: :feature do

  scenario 'valid inputs' do
    product = FactoryBot.create(:product)

    visit products_path
    click_on 'Edit'

    fill_in 'Name', with: "Jason's Filthy Steak"
    click_on 'Update Product'
    expect(page).to have_content("Jason's Filthy Steak")
  end
end