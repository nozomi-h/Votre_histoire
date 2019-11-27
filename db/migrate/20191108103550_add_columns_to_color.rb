class AddColumnsToColor < ActiveRecord::Migration[5.2]
  def change
    add_column :colors, :color, :integer, null: false, default: 0
  end
end
