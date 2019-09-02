class Admins::ArtistsController < ApplicationController
    before_action:authenticate_admin!

  def index
    @name = Artist.new
    @artist = Artist.page(params[:page])
  end
  
  def edit
    @name = Artist.find(params[:id])
    @artist = Artist.all
  end
  
  def create
    name = Artist.new(artist_params)
    name.save
    redirect_to admins_artists_path
  end
  
  def update
    name = Artist.find(params[:id])
    name.update(artist_params)
    redirect_to admins_artists_path
  end
  
  def destroy
    name = Artist.find(params[:id])
    name.destroy
    redirect_to admins_artists_path
  end
  
  private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
