class Users::CartItemsController < ApplicationController
  def index
    @total_price = 500
    @item_total_price = 0
    @cart = current_user.cart_items
    # binding.pry
    @order = Order.new
    @order_detail = OrderDetail.new
    @cart.each do |cart|
      @item_total_price = cart.item.price * cart.amount
      @total_price += @item_total_price
    end
  end
  
  def create
        cart = CartItem.new(cart_item_params)
        cart.user_id = current_user.id
      if cart.save
        redirect_to users_cart_items_path  
      else 
        p cart.errors.full_messages
        redirect_to users_items_path
      end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @item = @cart_item.item
  end
  
  def destroy
    @item = CartItem.find(params[:id])
    @item.destroy
    redirect_to users_cart_items_path
  end
  
  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end
    
    def order_params
      params.require(:order).permit(:total_price)
    end
end
