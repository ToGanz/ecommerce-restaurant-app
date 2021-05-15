class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :product, null: false, foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true
      t.decimal :unit_price
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
