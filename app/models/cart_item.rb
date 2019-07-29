class CartItem < ApplicationRecord
    belongs_to :items
    belongs_to :order
    
    validates :cd_amount, presence: true
    validates :cd_price, presence: true
end
