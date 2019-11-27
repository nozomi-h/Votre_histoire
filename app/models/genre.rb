class Genre < ApplicationRecord

  has_many :items, dependent: :destroy

  validates :genre, presence: true
  enum genre: {OUTER: 0, TOPS: 1, BOTTOMS: 2, ONEPICE:3, ACCESSORIES:4, SHOES:5, BAG:6}

end
