class ItemColorSize < ApplicationRecord

  belongs_to :color
  belongs_to :size
  belongs_to :item

end
