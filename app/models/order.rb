class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :user
    
    validates :total_price, presence: true
    validates :payment, presence: true
    validates :postal_code, presence: true, length: {in: 5.. 9}
    validates :address, presence: true
    
    accepts_nested_attributes_for :order_details


end
