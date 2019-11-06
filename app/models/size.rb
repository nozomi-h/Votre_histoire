class Size < ApplicationRecord

  has_many :item_color_size, dependent: :destroy

end
