class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :genre_name, null: false, default: 0

      t.timestamps
    end
  end
end
