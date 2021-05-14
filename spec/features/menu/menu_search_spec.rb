# require 'rails_helper'

# RSpec.describe 'search menu', type: :feature, js: true do
#   scenario 'only the searched products get displayed' do
#     category1 = FactoryBot.create(:category)
#     category2 = FactoryBot.create(:category)

#     product1 = FactoryBot.create(:product, category: category1)
#     product2 = FactoryBot.create(:product, category: category2)
#     product3 = FactoryBot.create(:product, category: category1)

#     visit menu_path

#     fill_in 'search',  with: product1.name
    
#     expect(page).to have_content(product1.name)
#     expect(page).not_to have_content(product2.name)
#     expect(page).not_to have_content(product3.name)

#   end
# end