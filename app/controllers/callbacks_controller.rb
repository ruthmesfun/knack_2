class CallbacksController < Devise::OmniauthCallbacksController

    def github
       user = User.from_omniauth(request.env["omniauth.auth"])

       log_in(user)
        redirect_to user_path(user)
    end
end