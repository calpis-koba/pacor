class Jenre < ApplicationRecord
    has_many :items, dependent: :destroy
end
