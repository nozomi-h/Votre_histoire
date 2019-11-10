class AddArrivalCountToArrival < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :arrival_count, :integer, null: false
    add_column :arrivals, :item_id, :integer, null: false
    add_column :arrivals, :arrival_date, :date, null: false
  end
end
