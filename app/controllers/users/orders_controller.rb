class Users::OrdersController < ApplicationController
    before_action:authenticate_user!

    def index
        @order = current_user.orders
        @orders = @order.page(params[:page]).order(created_at: :desc)
    end
    
    def new
        @order = Order.new
        @user = current_user
        @address = Address.new
    end
    
    def create
        
        address = current_user.addresses.build

        if params[:a].to_i == -1
            address.name = current_user.name
            address.address = current_user.address
            address.postal_code = current_user.postal_code
        elsif params[:a].to_i == 0
            address.name = params[:name]
            address.address = params[:address]
            address.postal_code = params[:postal_code]
            address.prefectures = params[:prefectures]
            address.save
        else
            ad = Address.find(params[:a])
            address.name = ad.name
            address.address = ad.address
            address.postal_code = ad.postal_code
        end
        
        # binding.pry
        
        sum = 500
        order = Order.new
        order.address = address.address
        order.user_id = current_user.id
        
         current_user.cart_items.each do |cart_item|
             sum += (cart_item.item.price*cart_item.amount)
         end
         order.total_price = sum
        #  binding.pry
         order.save

        current_user.cart_items.each do |cart_item|
            
            @item = OrderDetail.new
            @item.item_id =  cart_item.item_id
            @item.order_id = order.id
            @item.cd_price = cart_item.item.price
            @item.cd_amount = cart_item.amount
            @item.save
            
        end
        cart = current_user.cart_items
        # binding.pry
        cart.destroy_all
        redirect_to users_cart_items_top_path
    end
    
    private
    
    
end
