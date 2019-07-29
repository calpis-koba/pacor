class Admins::LabelsController < ApplicationController
      before_action:authenticate_admin!

  def index
    @name = Label.new
    @label = Label.all
  end
  
  def edit
    @name = Label.find(params[:id])
    @label = Label.all
  end
  
  def create
    name = Label.new(label_params)
    name.save
    redirect_to admins_labels_path
  end
  
  def update
    name = Label.find(params[:id])
    name.update(label_params)
    redirect_to admins_labels_path
  end
  
  def destroy
    name = Label.find(params[:id])
    name.destroy
    redirect_to admins_labels_path
  end
  
  private
  def label_params
    params.require(:label).permit(:name)
  end
end
