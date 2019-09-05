class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :user
    
    validates :total_price, presence: true
    validates :address, presence: true
    validates :payment, presence: true
    
    accepts_nested_attributes_for :order_details

    

    def save_details(user)
    	user.cart_items.each do |cart_item|
            
            item = OrderDetail.new
            item.item_id =  cart_item.item_id
            item.order_id = id
            item.cd_price = cart_item.item.price
            item.cd_amount = cart_item.amount
            item.save
        end
    end

end
