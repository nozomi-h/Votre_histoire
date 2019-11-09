class AddColumnsToSize < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :size, :integer, null: false, default: 0
  end
end
