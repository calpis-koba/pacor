class Disk < ApplicationRecord
    
    has_many :songs ,dependent: :destroy
    belongs_to :item

    accepts_nested_attributes_for :songs

end
