class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # downcaseは小文字にすることを意味している
  before_save { self.email = email.downcase }

  ## nameの文字数は、1文字から10文字まで
  ## 全角ひらがな、漢字
  validates :first_name, format: { with: /\A[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 20 },
    presence: true
  validates :last_name, format: { with: /\A^[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 20 },
    presence: true
  ## 全角カタカナ
  validates :first_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 20 },
    presence: true
  validates :last_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 20 },
    presence: true

  ## tel_numberは、ハイフンなしの数字10桁or11桁
  validates :tel_number, format: { with: /\A\d{10,11}\z/ },
    presence: true
  ## emailは、40文字まで
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }, length: { maximum: 40 },
    presence: true

  ## postal_codeは、数字３桁＋数字４桁の形式　　/\A(\d{7}|^$)\z/
  validates :postal_code, presence: false, format: { with: /\A(\d{7}|^$)\z/ },
    presence: true
  # validates :prefecture
  validates :city_address,
    presence: true
  # validates :building

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :favorite, dependent: :destroy
  has_many :cart, dependent: :destroy
  has_many :order, dependent: :destroy
  has_many :address, dependent: :destroy

end
