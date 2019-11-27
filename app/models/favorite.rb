class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
end
