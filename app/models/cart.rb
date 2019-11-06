class Cart < ApplicationRecord

  belongs_to :user
  belongs_to :item

  acts_as_paranoid

end
