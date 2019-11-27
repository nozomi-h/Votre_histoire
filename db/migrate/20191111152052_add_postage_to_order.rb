class AddPostageToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :postage, :integer
    add_column :orders, :order_number, :string
    add_column :orders, :delivery_last_name, :string
    add_column :orders, :delivery_first_name, :string
    add_column :orders, :delivery_last_kana_name, :string
    add_column :orders, :delivery_first_kana_name, :string
    add_column :orders, :deleted_at, :datetime
  end
end
