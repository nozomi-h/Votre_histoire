class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :address_id, null: false
      t.integer :amount, null: false
      t.string :purchase_price, null: false
      t.integer :payment, null: false

      # created_at,updated_atが含まれている
      t.timestamps
    end
  end
end
