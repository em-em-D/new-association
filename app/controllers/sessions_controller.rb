class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email:params[:session][:email].downcase)
        if user
            sign_in user
            user user
            redirect_to  '/dashboard'
        else
            flash.now[:notice] = 'Invalid credentials'
            render :new
        end
    end

    def destroy
        sign_out
        redirect_to root_path
    end

end
