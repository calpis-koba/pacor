class Admins::JenresController < ApplicationController
      before_action:authenticate_admin!

  def index
    @name = Jenre.new
    @jenre = Jenre.page(params[:page])
  end
  
  def edit
    @name = Jenre.find(params[:id])
    @jenre = Jenre.all
  end
  
  def create
    name = Jenre.new(jenre_params)
    name.save
    redirect_to admins_jenres_path
  end
  
  def update
    @name = Jenre.find(params[:id])
    @name.update(jenre_params)
    redirect_to admins_jenres_path
  end
  
  def destroy
    name = Jenre.find(params[:id])
    name.destroy
    redirect_to jenres_path
  end
  
  private
  def jenre_params
    params.require(:jenre).permit(:name)
  end
end
