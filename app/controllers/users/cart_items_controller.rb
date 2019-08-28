class Users::CartItemsController < ApplicationController
   before_action :authenticate_user!
   
   def top
   end
  
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
        # p cart.errors.full_messages
      if current_user.cart_items.exists?(item_id: cart.item_id)
        update_cart_item = current_user.cart_items.find_by(item_id: cart.item_id)
        update_cart_item.amount += cart.amount
        update_cart_item.update(amount: update_cart_item.amount)
      else 
        cart.save
      end
      redirect_to users_cart_items_path  
  end
  
  def update
    cart = CartItem.find(params[:id])
    cart.amount = 1
    update_cart_item = current_user.cart_items.find_by(item_id: cart.item_id)
    update_cart_item.amount += cart.amount
    update_cart_item.update(amount: update_cart_item.amount)
    redirect_to users_cart_items_path
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
