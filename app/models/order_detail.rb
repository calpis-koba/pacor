class OrderDetail < ApplicationRecord
    belongs_to :item_params
    belongs_to :order
    
    validates :cd_amount, presence: true
    validates :cd_price, presence: true
end
