class AddArrivalCountToArrival < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :arrival_count, :integer, default: 0, null: false
    add_column :arrivals, :item_id, :integer
    add_column :arrivals, :arrival_date, :date
  end
end
