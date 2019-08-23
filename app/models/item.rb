class Item < ApplicationRecord
    
    has_many :disks, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :order_details
    
    belongs_to :artist
    belongs_to :jenre
    belongs_to :label
    
    validates :title, presence: true
    validates :price, presence: true
    validates :stock, presence: true

    attachment :jacket_image
    
    accepts_nested_attributes_for :disks

    def self.search(search)
      return Item.all unless search
      Item.where(['title LIKE ?', "%#{search}%"])
    end
    
end
