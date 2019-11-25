class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order

  ## 販売されていた商品がorderされてそのorder_itemの在庫が0になったら"SLOD OUT"(status:2)と表示するという意味)
  after_save do |order_item|
    order_item.item.update(status: 2) if order_item.item.arrival <= 0
  end
end
