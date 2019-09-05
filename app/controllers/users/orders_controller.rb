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
        order.postal_code = address.postal_code
        
         current_user.cart_items.each do |cart_item|
             sum += (cart_item.item.price*cart_item.amount)
         end
         order.total_price = sum
        #  binding.pry
        if order.save

            order.save_details(current_user)
            
            cart = current_user.cart_items
            # binding.pry
            cart.destroy_all
            redirect_to users_cart_items_top_path

        else
            redirect_to users_cart_items_path
        end
    end
    
    private
    
    
end
