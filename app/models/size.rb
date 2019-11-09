class Size < ApplicationRecord

  has_many :item_color_size, dependent: :destroy

  enum size: {S: 0, M: 1, '24': 2, '25': 3, '26': 4, Free:5 }

end
