class Users::CartItemsController < ApplicationController
  def index
    @cd = Cart_item.all
  end
  
  def create
    @cart = current_cart
    @item = Item.find(params[:item_id])
    
  end
  
  private
    def cart_item_params
    end
end
