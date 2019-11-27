class ItemColorSize < ApplicationRecord

  belongs_to :item_color
  belongs_to :size

  enum size: {S: 0, M: 1, '24': 2, '25': 3, '26': 4, Free:5 }
end
