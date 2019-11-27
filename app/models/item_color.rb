class ItemColor < ApplicationRecord

  has_many :item_color_sizes

  belongs_to :item
  belongs_to :color
  accepts_nested_attributes_for :item_color_sizes, allow_destroy: true ## 子モデルの編集、削除などについて
end
