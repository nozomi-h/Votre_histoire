class ItemColorSize < ApplicationRecord

  has_many :colors, dependent: :destroy
  has_many :sizes, dependent: :destroy

  belongs_to :item

end
