class Item < ApplicationRecord

  has_many :arrivals

  has_many :carts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :item_color_sizes, dependent: :destroy
  has_many :colors, through: :item_color_sizes ## throughでitem_color_sizeを通してcolorsを取得する
  accepts_nested_attributes_for :colors, allow_destroy: true
  has_many :sizes, through: :item_color_sizes ## throughでitem_color_sizeを通してsizesを取得する
  accepts_nested_attributes_for :sizes, allow_destroy: true

  validates :prodct_name, presence: true
  validates :price, presence: true
  validates :status, presence: true

  attachment :image

  enum status: {available: 0, not_available: 1, sold_out: 2}
  enum genre: {OUTER:0, TOPS:1, BOTTOMS:2, ONEPICE:3, ACCESSORIES:4, SHOES:5}
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

  def self.search(search) #self.でクラスメソッドとしている
    if search ## Controllerから渡されたパラメータが!= nilの場合は、nameカラムを部分一致検索
      Item.where(['prodct_name LIKE ?', "%#{search}%"])
      ## %はどんな文字でもokという意味 　## like=曖昧検索 %を含む事で初めて使える演算子  ## likeを=に変えて%を消す → 完全一致した物のみ
    else
      Item.all ## 全て表示。
    end
  end

end
