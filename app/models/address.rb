class Address < ApplicationRecord

  ## 1対多 の1がbelongs_to
  belongs_to :user

  def connected_address
    address = self.postal_code + " " + self.prefecture + " "  + self.city_address + " " + self.building
    return address
  end

  def delivery_destination
    self.last_name + " " + self.first_name + " " + self.last_kana_name + " " + self.first_kana_name + " " + connected_address
  end


  #postal_codeは、数字7桁
  validates :postal_code, presence: true, format: { with: /\A(\d{7}|^$)\z/ }
  validates :prefecture, presence: true
  validates :city_address, presence: true
  validates :building, presence: true

end
