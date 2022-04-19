class OmniauthController < ApplicationController

    def facebook
        @user = User.create_from_provider_data(request.env["omniauth.auth"])
        if @user.persisted?
            flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Facebook'
            sign_in_and_redirect @user, event: :authentication
        else
            session['devise.facebook_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
            redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
        end
    end

    def google_oauth2
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.create_from_provider_data(request.env['omniauth.auth'])

        if @user.persisted?
            flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
            sign_in_and_redirect @user, event: :authentication
        else
            session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
            redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
        end
    end
    
    def failure
        flash[:error] = 'Tenemos un problema para iniciar sesión. Por favor regístrate o vuelve a iniciar sesión mas tarde.'
        redirect_to new_user_registration_path
    end
end
