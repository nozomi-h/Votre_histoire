class Order < ApplicationRecord

  belongs_to :user
  belongs_to :address

  has_many :order_items, dependent: :destroy

  ## 注文番号
  after_save { self.order_number = self.id.to_s + SecureRandom.hex(3).to_s }

  ## status=配送状況 / payment=支払方法
  enum status: { preparing: 0, in_delivery: 1, delivered: 2 }
  enum payment: { credit_card: 0, transfer: 1, cash: 2 }

  # .sum(:price)prodcts

end
