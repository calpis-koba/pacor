class Users::AddressesController < ApplicationController
    def edit
        @address = Address.find[params(:id)]
    end
    
    def update
        address = Address.find(params[:id])
        address.update(address_params)
        redirect_to new_users_order_path
    end
    
    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to new_users_order_path
    end
    
    private
        def address_params
            params.require(:address).permit(:name, :postal_code, :address, :prefectures)
        end
end
