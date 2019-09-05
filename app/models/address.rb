class Address < ApplicationRecord
    belongs_to	:user
     validates	:name,	presence: true, length: {in: 1.. 30}
     validates	:postal_code, length: {in: 5.. 9}, format: { with: /\w/ }
     validates   :address, presence: true
end
