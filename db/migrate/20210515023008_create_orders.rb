class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.boolean "paid", default: false
      t.boolean "delivered", default: false
      t.boolean "canceled", default: false

      t.timestamps
    end
  end
end
