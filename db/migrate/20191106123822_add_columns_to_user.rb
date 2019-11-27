class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_kana_name, :string
    add_column :users, :last_kana_name, :string
    add_column :users, :tel_number, :string
    add_column :users, :postal_code, :string
    add_column :users, :prefecture, :string
    add_column :users, :city_address, :string
    add_column :users, :building, :string
    add_column :users, :birth_day, :date
    add_column :users, :sex, :integer
  end
end
