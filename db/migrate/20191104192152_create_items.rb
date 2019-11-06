class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :genre_name, null: false
      t.string :prodct_name, null: false
      t.string :image_id
      t.string :material, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
