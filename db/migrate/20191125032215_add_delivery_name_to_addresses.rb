class AddDeliveryNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :delivery_last_name, :string
    add_column :addresses, :delivery_first_name, :string
    add_column :addresses, :delivery_last_kana_name, :string
    add_column :addresses, :delivery_first_kane_name, :string
  end
end
