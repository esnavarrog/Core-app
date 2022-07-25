class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def require_user
		unless current_user
			redirect_to new_user_session_path
		end
	end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nickname, :email, :avatar, :role, :password) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nickname, :email, :avatar,:role, :password, :password_confirmation) }
    end



end
