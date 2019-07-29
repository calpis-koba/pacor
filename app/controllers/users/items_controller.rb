class Users::ItemsController < ApplicationController
    def index
        @cd = Item.all
    end
end
