class Users::OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @user = current_user
        @address = Address.new
    end
    
    def create
        order = Order.new(order_params)
        order.save
        order_pay = Order.new(order_pay_params)
        if order_pay.save
            redirect_to users_order_details_path
        else
            redirect_to new_users_orders_path
        end
    end
    
    private
    
    def order_params
      params.require(:order).permit(:total_price, order_attributes: [:id, :cart_item_id])
    end
    def order_pay_params
      params.require(:order).permit(:payment, :postal_code, :address)
    end     
end
