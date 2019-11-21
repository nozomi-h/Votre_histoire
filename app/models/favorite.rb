class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :micropost_id, presence: true
  ## favoriteするには user_id と item_id が必須である

end
