class Admins::ItemsController < ApplicationController
      before_action:authenticate_admin!

    def index
        @cd = Item.all
        
        
    end
    
    def edit
        @cd = Item.find(params[:id])
        @cd.disks.build
        @artist = Artist.all
        @label = Label.all
        @jenre = Jenre.all
    end
    
    def show
        @cd = Item.find(params[:id])
        @songs = @cd.disks.songs
    end
    
    def new
        @cd = Item.new
        @cd.disks.build
        @artist = Artist.all
        @label = Label.all
        @jenre = Jenre.all
    end
    
    def create
        cd = Item.new(item_params)
        cd.save
        redirect_to admins_items_path
    end
    
    def update
        cd = Item.find(params[:id])
        cd.update(item_params)
        redirect_to admins_items_path
    end
    
    private
    def item_params
        params.require(:item).permit(:artist_id, :label_id, :jenre_id, :title, :price, :status, :jacket_image, :stock, disks_attributes:[:id, :_destroy, songs_attributes:[:id, :title]])
    end
  
end
