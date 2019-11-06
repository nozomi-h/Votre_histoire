class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_kana_name, null: false
      t.string :last_kana_name, null: false
      t.string :tel_number, null: false
      t.string :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city_address, null: false
      t.string :building, null: false

      t.timestamps
    end
  end
end
