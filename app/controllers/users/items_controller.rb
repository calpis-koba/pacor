class Users::ItemsController < ApplicationController
    def index
        @item = Item.all
    end
    
    def new
        @item = Cart_item.new
    end
    
    def create
        cart.new(cart_params)
        cart.user_id = current_user.id
        cart.save
        redirect_to users_items_path
    end
    
    
    private
        def cart_params
            params.require(:cart).permit(:item_id)
        end
end
