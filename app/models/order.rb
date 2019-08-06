class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :user
    
    validates :total_price, presence: true
    validates :address, presence: true
    
    accepts_nested_attributes_for :order_details


end
