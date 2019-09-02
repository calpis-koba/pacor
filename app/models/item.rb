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
    
    accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true
    
    def self.search(search)
      if search
        Item.where(['title LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end

end
