class CreateItemColorSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_color_sizes do |t|
      t.integer :item_color_id
      t.integer :size_id

      t.timestamps
    end
  end
end
