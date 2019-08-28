class Users::UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = current_user
    end
    
    def edit
        @user = current_user
    end
    
    def update
        @user = current_user
        @user.update(user_params)
        redirect_to users_user_path(@user)
    end
    
    def unsubscribe_confirm
    end

  def unsubscribe
    current_user.destroy
    reset_session
    flash[:success] = "退会しました"
    redirect_to new_user_registration_path
  end
    
    
    private
    def user_params
        params.require(:user).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:phone,:postal_code,:address,:email)
    end
end
