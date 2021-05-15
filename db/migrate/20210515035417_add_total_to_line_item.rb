class AddTotalToLineItem < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :total, :decimal
  end
end
