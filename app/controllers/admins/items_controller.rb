class Admins::ItemsController < ApplicationController
      before_action:authenticate_admin!

    def index
        @cd = Item.all
        
        
    end
    
    def edit
        @cd = Item.find(params[:id])
        @artist = Artist.all
        @label = Label.all
        @jenre = Jenre.all
    end
    
    def new
        @cd = Item.new
        @artist = Artist.all
        @label = Label.all
        @jenre = Jenre.all
    end
    
    def create
        cd = Item.new(item_params)
        @song = Song.new(song_params)
        if cd.save
            @song.save
            redirect_to admins_items_path
        else
            redirect_to new_admins_item_path
        
        end
    end
    
    def update
        cd = Item.find(params[:id])
        cd.update(item_params)
        redirect_to admins_items_path
    end
    
    private
    def item_params
        params.require(:item).permit(:artist_id, :label_id, :jenre_id, :title, :price, :status, :jacket_image, :stock, disks_attributes:[:id, songs_attributes:[:id, :title]])
    end
  
end
