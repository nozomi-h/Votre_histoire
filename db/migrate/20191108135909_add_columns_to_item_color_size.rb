class AddColumnsToItemColorSize < ActiveRecord::Migration[5.2]
  def change
    add_column :item_color_sizes, :item_id, :integer
    add_column :item_color_sizes, :color_id, :integer
    add_column :item_color_sizes, :size_id, :integer
  end
end
