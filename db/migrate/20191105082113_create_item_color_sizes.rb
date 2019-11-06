class CreateItemColorSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_color_sizes do |t|

      t.timestamps
    end
  end
end
