class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:kana_last_name,:kana_first_name,:phone,:postal_code,:address,:email])
    end
    
 
     #sign in後のredirect先変更
    def after_sign_in_path_for(resource)
      case resource
      when Admin
        admins_items_path
      when User
        users_items_path
      end
    end

    #sign out後のredirect先変更
    def after_sign_out_path_for(resource)
      case resource
      when :admin
        new_admin_registration_path
      when :user
        new_user_registration_path
      end
    end
  
end
