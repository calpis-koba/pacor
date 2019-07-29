class Users::UsersController < ApplicationController
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
    
    private
    def user_params
        params.require(:user).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:phone,:postal_code,:address,:email)
    end
end
