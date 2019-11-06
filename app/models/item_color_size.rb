class ItemColorSize < ApplicationRecord

  has_many :color, dependent: :destroy
  has_many :size, dependent: :destroy

end
