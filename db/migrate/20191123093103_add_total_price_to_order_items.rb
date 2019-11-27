class AddTotalPriceToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :order_id, :integer
    add_column :order_items, :total_price, :integer
    add_column :order_items, :deleted_at, :datetime
  end
end
