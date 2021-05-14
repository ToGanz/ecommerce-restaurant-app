require 'rails_helper'

RSpec.describe 'display menu', type: :feature do
  scenario 'products get displayed by category ' do
    category1 = FactoryBot.create(:category)
    category2 = FactoryBot.create(:category)

    product1 = FactoryBot.create(:product, category: category1)
    product2 = FactoryBot.create(:product, category: category2)
    product3 = FactoryBot.create(:product, category: category1)

    visit menu_path

    within(".category-#{category1.id}") do
      expect(page).to have_content(category1.name)
      expect(page).not_to have_content(category2.name)
      expect(page).to have_content(product1.name)
      expect(page).not_to have_content(product2.name)
      expect(page).to have_content(product3.name)
    end

    within(".category-#{category2.id}") do
      expect(page).not_to have_content(category1.name)
      expect(page).to have_content(category2.name)
      expect(page).not_to have_content(product1.name)
      expect(page).to have_content(product2.name)
      expect(page).not_to have_content(product3.name)
    end

  end
end