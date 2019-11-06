class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :address_id, null: false
      t.string :purchase_price, null: false
      t.string :payment, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
