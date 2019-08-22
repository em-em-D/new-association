class SessionsController < ApplicationController
    def create
        user = User.find_by(email:login_params[:email])
        if user #&& user.authenticate(login_params[:password])
            session[:user_email] = user.email
            redirect_to '/dashboard'
        else
            flash[:login_errors] = ['invalid information']
            redirect_to '/'
        end
    end

    private

    def login_params
       params.require(:login).permit(:email,:password, :password_confirmation)
    end
end
