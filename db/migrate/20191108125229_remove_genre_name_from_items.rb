class RemoveGenreNameFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items,:genre_name
  end
end
