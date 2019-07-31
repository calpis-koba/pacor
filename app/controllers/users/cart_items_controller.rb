class Users::CartItemsController < ApplicationController
  def index
    @cart = CartItem.all
  end
  
  def create
        cart = CartItem.create
        cart = CartItem.build(cart_item_params)
        cart.user_id = current_user.id
        cart.save
        redirect_to users_items_path  
  end
  
  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end
end
