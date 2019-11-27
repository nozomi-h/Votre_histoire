class Arrival < ApplicationRecord

  belongs_to :item

  ## 入荷数と入荷日の記入を必須としている
    validates :arrival_count, presence: true
    validates :arrival_date, presence: true

end
