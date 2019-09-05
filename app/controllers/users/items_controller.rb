class Users::ItemsController < ApplicationController
    def index
        @item = Item.search(params[:search]).page(params[:page]).order(created_at: :desc)
    end
    
    def show
        @item = Item.find(params[:id])
        @cart = CartItem.new
        @a = 0
        
        @current_stock_array = []
        @item.stock.times do |amount|
            @current_stock_array << amount + 1
        
        end
        limit = 10
        @current_stock_array =  @item.stock > limit ? (1..limit).to_a : (1..@item.stock).to_a
    end
    
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to users_cart_items_path
  end
    
end
