class Admins::UsersController < ApplicationController
      before_action:authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @admin = current_admin
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    # binding.pry
    redirect_to admins_users_path
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to admins_users_path 
  end
  
  private
    def user_params
      params.require(:user).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:phone,:postal_code,:address,:email)
    end
  
end
