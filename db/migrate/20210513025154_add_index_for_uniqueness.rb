class AddIndexForUniqueness < ActiveRecord::Migration[6.1]
  def change

    add_index :categories, :name, unique: true
    add_index :products, :name, unique: true

  end
end
