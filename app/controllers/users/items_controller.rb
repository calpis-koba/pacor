class Users::ItemsController < ApplicationController
    def index
        @item = search_items
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
  
  def search_items
      if params[:search]
        Item.search(params[:search])
      else
        Item.page(params[:page]).reverse_order
      end
  end
    
end
