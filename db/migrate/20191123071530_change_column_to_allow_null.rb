class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column :carts, :address_id,:integer, null: true
    change_column :carts, :purchase_price,:string, null: true
    change_column :carts, :payment,:string, null: true
  end
end
