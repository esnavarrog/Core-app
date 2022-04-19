class OmniauthController < ApplicationController

    def all
        @user = User.create_from_provider_data(request.env["omniauth.auth"])
        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => user.provider.titleize
        else
            session["devise.user_attributes"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_path
        end
    end


    alias_method :facebook, :all
    alias_method :google_oauth2, :all
    
    def failure
        flash[:error] = 'Tenemos un problema para iniciar sesión. Por favor regístrate o vuelve a iniciar sesión mas tarde.'
        redirect_to new_user_registration_path
    end
end
