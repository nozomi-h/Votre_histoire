class AddItemColorToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :item_color_id, :integer
    add_column :carts, :item_color_size_id, :integer
  end
end
