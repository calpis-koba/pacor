class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :addresses, dependent: :destroy
  

  validates :last_name,length: {in: 1.. 15},format: { with: /\A\p{blank}*[^\p{katakana}\p{blank}ｧ-ﾝﾞﾟ]+\p{blank}*\z/}
  validates :first_name,length: {in: 1.. 15},format: { with: /\A\p{blank}*[^\p{katakana}\p{blank}ｧ-ﾝﾞﾟ]+\p{blank}*\z/}
  validates :kana_last_name,length: {in: 1.. 15},format: { with: /\A[\p{katakana}-]+\z/}
  validates :kana_first_name,length: {in: 1.. 15},format: { with: /\A[\p{katakana}-]+\z/}
  validates :phone, length: {in: 10.. 11}
  validates :postal_code, length: {in: 5.. 9}, format: { with: /\w/ }
  validates :address, presence: true
end
