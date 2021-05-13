class AddCategoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category, foreign_key: true, null: false
  end
end
