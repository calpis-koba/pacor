class Users::OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @user = current_user
        @address = Address.new
    end
    
    def create
       
        address = current_user.addresses.build
        address.name = params[:name]
        address.address = params[:address]
        address.postal_code = params[:postal_code]
        address.prefectures = params[:prefectures]
        address.save
        sum = 0
        order = Order.new
        order.address = params[:address]
        order.user_id = current_user.id
        
         current_user.cart_items.each do |cart_item|
             sum += cart_item.item.price
         end
         order.total_price = sum 
         order.save

        current_user.cart_items.each do |cart_item|
            
            @item = OrderDetail.new
            @item.item_id =  cart_item.item_id
            @item.order_id = order.id
            @item.cd_price = cart_item.item.price
            @item.cd_amount = cart_item.amount
            @item.save
            
        end
        redirect_to users_orders_path
    end
    
    private
    
    def order_params
      params.require(:order).permit(:total_price,:payment, :postal_code, :address, order_details_attributes: [:item_id, :cd_amount, :cd_price])
    end
    
    def address_params
    　params.require(:address).permit(:name, :postal_code, :address, :prefectures)
    end
end
