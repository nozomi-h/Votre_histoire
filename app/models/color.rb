class Color < ApplicationRecord

  ## 1対多 の多がhas_many / dependent: :destroyは1対多の関係になっている1を丸々消すという意味
  has_many :item_color_size, dependent: :destroy

end
