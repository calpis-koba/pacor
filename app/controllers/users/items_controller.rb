class Users::ItemsController < ApplicationController
    def index
        @item = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
        @cart = CartItem.new
        
        @current_stock_array = []
        @item.stock.times do |amount|
            @current_stock_array << amount + 1
        
        end
    end
    
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to users_cart_items_path
  end
    
end
