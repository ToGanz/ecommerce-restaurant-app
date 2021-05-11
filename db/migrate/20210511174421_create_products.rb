class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, default: ''
      t.decimal :price, default: 0.0
      t.boolean :vegetarian, default: false
      t.boolean :vegan, default: false
      t.boolean :available, default: true
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
