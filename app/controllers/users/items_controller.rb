class Users::ItemsController < ApplicationController
    def index
        @item = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
        @cart = CartItem.new
    end
    
end
