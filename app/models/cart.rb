class Cart < ApplicationRecord

  belongs_to :user
  belongs_to :item

  def purchase_price
    sum = 0
    order_items.each do |order_item|
      sum += order_item.total_price * order_item.amount
    end
    return sum + 600
end

end
