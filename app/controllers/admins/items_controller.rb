class Admins::ItemsController < ApplicationController
      before_action:authenticate_admin!

    def index
        @item = Item.all

    end

    def edit
        @item = Item.find(params[:id])
        @item.disks.build
        @artist = Artist.all
        @label = Label.all
        @jenre = Jenre.all
    end

    def show
        @item = Item.find(params[:id])

    end

    def new
        @item = Item.new
        @item.disks.build
        @artist = Artist.all
        @label = Label.all
        @jenre = Jenre.all
    end

    def create
        item = Item.new(item_params)
        item.save
        redirect_to admins_items_path
    end

    def update
        item = Item.find(params[:id])
        item.update(item_params)
        redirect_to admins_items_path
    end

    private
    def item_params
        params.require(:item).permit(:artist_id, :label_id, :jenre_id, :title, :price, :status, :jacket_image, :stock, disks_attributes:[:id, :_destroy, songs_attributes:[:id, :title]])
    end

end
