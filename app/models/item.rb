class Item < ApplicationRecord

  has_many :arrivals

  has_many :carts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :item_color_sizes, dependent: :destroy

  validates :genre_name, presence: true
  validates :prodct_name, presence: true
  validates :price, presence: true
  validates :status, presence: true

  attachment :image
    enum status: {available: 0, not_available: 1, sold_out: 2}

    validates :prodct_name, presence: true
    validates :price, presence: true
    validates :status, presence: true

  acts_as_paranoid

  def favorited_by?(current_user)
    favorites.where(user_id: current_user.id).exists?
  end

  def stock
    (Stock.where(item_id: id).sum(:arrival_count)) - (OrderItem.where(item_id: id).sum(:amount))
  end

  def tax_include
    tax_include = self.price * 1.10
    return tax_include
  end
end
