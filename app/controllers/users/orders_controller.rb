class Users::OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @user = current_user
    end
    
    def create
        order = Order.new(order_params)
        order.save
        redirect_to users_order_details_path
    end
    
    private
    
    def order_params
      params.require(:order).permit(:total_price, :payment, :postal_code, :address, order_attributes: [:id, :cart_item_id])
    end
end
