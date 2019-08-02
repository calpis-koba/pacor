class Users::AddressesController < ApplicationController
    def create
        address = Address.new(address_params)
        address.save
    end
    
    private
        def address_params
            params.require(:address).permit(:payment, :postal_code, :address)
        end
end
